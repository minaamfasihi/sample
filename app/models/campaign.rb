class Campaign < ApplicationRecord
  has_many :todo_lists, dependent: :destroy
  belongs_to :expert

  validates :title, presence: true, length: { maximum: 100 }
  validates :tag, presence: true, length: { maximum: 30 }
  validates :estimated_duration, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 } 
end
