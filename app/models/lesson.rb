class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :results, dependent: :destroy
  has_many :words, through: :results, dependent: :destroy
  has_many :answers, through: :results, dependent: :destroy
  has_many :activities, as: :action, dependent: :destroy
  after_save :get_activity
  before_create :delete_existing_lessons

  def correct_answers
    self.answers.where is_correct: true
  end

  def get_activity
    self.activities.create(user_id: user.id) if score.present?
  end

  def delete_existing_lessons
      user.lessons.find_by(category_id: category.id).try(:destroy)
  end
end
