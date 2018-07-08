class TodoList < ApplicationRecord
  has_many :todo_items, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :campaign
  belongs_to :user

  enum status: [:Completed, :Remaining]
end
