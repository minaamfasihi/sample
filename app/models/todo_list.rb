class TodoList < ApplicationRecord
  has_many :todo_items, dependent: :destroy
  has_many :comments, dependent: :destroy

  enum status: [:completed, :remaining]
end
