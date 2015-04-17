class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :unreads, dependent: :destroy, as: :resource

  after_create :create_unreads

  def create_unreads
    User.where.not(id: self.user_id).each do |user|
      self.unreads.create!(user: user)
    end
  end

  def subject
    self.body.lines.first.truncate(20)
  end

  def is_unread?(user)
    self.unreads.where(unreads: {user_id: user.id}).present?
  end

  def has_unread_comments?(user)
    self.comments.unscoped.joins(:unreads).where(unreads: {user_id: user.id}).present?
  end

end
