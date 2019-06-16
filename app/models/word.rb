class Word < ApplicationRecord
  belongs_to :category
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers
  default_scope ->{order(created_at: :desc)}
  validates :name, presence: true, length: {maximum: 15}

  def answer_right
    answers.find_by(is_correct: true).try(:content)
  end
end
