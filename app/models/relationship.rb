class Relationship < ApplicationRecord
  belongs_to :follower, class_name: User.name, foreign_key: :follower_id
  belongs_to :followed, class_name: User.name, foreign_key: :followed_id
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  has_many :activities, as: :action, dependent: :destroy
  after_save :get_follow_activity

  def get_follow_activity
    self.activities.create user_id: follower_id, action_id: followed.id, target_type: :followed
  end
end
