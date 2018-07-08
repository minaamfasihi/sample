class TodoItem < ApplicationRecord
  belongs_to :todo_list

  validates :item, presence: true, length: { maximum: 100 }

  enum status: [:completed, :remaining]
end
