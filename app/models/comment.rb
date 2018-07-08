class Comment < ApplicationRecord
  belongs_to :todo_list

  validates :title, presence: true, length: { maximum: 100 }
end
