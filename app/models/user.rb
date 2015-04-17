class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :unreads, dependent: :destroy

  def self.create_by_github(auth)
    User.create!(github_id: auth[:uid],
                 name: auth[:info][:name] || auth[:info][:nickname],
                 email: auth[:info][:email],
                 image: auth[:info][:image],
                 auth_hash: auth)
  end

  def unread_posts_for(user)
    self.posts.joins(:unreads).where(unreads: {user_id: user.id})
  end

  def unread_comments_for(user)
    self.posts.joins(:comments).joins("LEFT JOIN unreads ON unreads.resource_id = comments.id AND unreads.resource_type = 'Comment'")
      .where(unreads: {user_id: user.id})
  end

  def read(resources)
    return if resources.blank?
    self.unreads.where(resource: resources).delete_all
  end

  def image
    super || "https://avatars.githubusercontent.com/u/#{github_id}"
  end

end
