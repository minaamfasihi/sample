class AddCampaignIdToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :campaign, foreign_key: true, index: true
  end
end
