class Activity < ApplicationRecord
  belongs_to :action, polymorphic: true
  belongs_to :user
  enum target_type: {followed: 0, unfollow: 1}
  default_scope -> {order(created_at: :desc)}
end
