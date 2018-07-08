class AddCampaignIdToTodoList < ActiveRecord::Migration[5.1]
  def change
    add_reference :todo_lists, :campaign, foreign_key: true, index: true
  end
end
