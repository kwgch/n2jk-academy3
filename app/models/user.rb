class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  def self.create_by_github(auth)
    User.create!(github_id: auth[:uid],
                 name: auth[:info][:name] || auth[:info][:nickname],
                 email: auth[:info][:email],
                 image: auth[:info][:image],
                 auth_hash: auth)
  end


  def image
    super || "https://avatars.githubusercontent.com/u/#{github_id}"
  end

end
