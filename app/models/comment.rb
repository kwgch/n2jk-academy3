class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :unreads, dependent: :destroy, as: :resource

  default_scope { order(created_at: :asc) }

  after_create :create_unreads

  def is_unread?(user)
    self.unreads.where(unreads: {user_id: user.id}).present?
  end

  def create_unreads
    User.where.not(id: self.user_id).each do |user|
      self.unreads.create!(user: user)
    end
  end
end
