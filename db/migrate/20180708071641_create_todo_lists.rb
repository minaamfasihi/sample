class CreateTodoLists < ActiveRecord::Migration[5.1]
  def change
    create_table :todo_lists do |t|
      t.integer :status

      t.timestamps
    end
    add_index :todo_lists, :status
  end
end
