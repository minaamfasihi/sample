class RenameUserIdToExpertIdInCampaigns < ActiveRecord::Migration[5.1]
  def change
    rename_column :campaigns, :user_id, :expert_id
  end
end
