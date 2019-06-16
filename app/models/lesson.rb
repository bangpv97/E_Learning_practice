class Lesson < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :results, dependent: :destroy
  has_many :words, through: :results, dependent: :destroy
  has_many :answers, through: :results, dependent: :destroy

  def get_correct
    answers.where(is_correct: true)
  end
end
