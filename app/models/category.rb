class Category < ApplicationRecord
  has_many :lessons
  has_many :words
  default_scope ->{order(created_at: :desc)}
  validates :name, presence: true

  def self.has_words
    Category.where(id: Word.select(:category_id).map(&:category_id))
  end
end
