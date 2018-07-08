class Comment < ApplicationRecord
  belongs_to :todo_list
  belongs_to :campaign

  validates :title, presence: true, length: { maximum: 100 }
end
