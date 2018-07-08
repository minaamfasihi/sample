class CreateTodoItems < ActiveRecord::Migration[5.1]
  def change
    create_table :todo_items do |t|
      t.string :item
      t.integer :status, index: true
      t.references :todo_lists, foreign_key: true, index: true

      t.timestamps
    end
  end
end
