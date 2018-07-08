class RemoveCampaignIdFromComments < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :comments, :campaigns
  end
end
