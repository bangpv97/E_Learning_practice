class Answer < ApplicationRecord
  belongs_to :word
  validates :content, presence: true, length: {maximum: 15}
  has_many :results, dependent: :destroy
end
