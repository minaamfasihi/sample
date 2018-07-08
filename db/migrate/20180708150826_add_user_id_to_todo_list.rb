class AddUserIdToTodoList < ActiveRecord::Migration[5.1]
  def change
    add_reference :todo_lists, :user, foreign_key: true, index: true
  end
end
