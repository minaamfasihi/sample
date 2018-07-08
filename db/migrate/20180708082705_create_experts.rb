class CreateExperts < ActiveRecord::Migration[5.1]
  def change
    create_table :experts do |t|
      t.string :profession, index: true
      t.string :service
      
      t.timestamps
    end
  end
end
