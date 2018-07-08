class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.string :tag
      t.integer :estimated_duration

      t.timestamps
    end
    add_index :campaigns, :tag
    add_index :campaigns, :estimated_duration
  end
end
