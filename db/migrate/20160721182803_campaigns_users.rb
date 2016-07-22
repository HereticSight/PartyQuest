class CampaignsUsers < ActiveRecord::Migration
  def change
    create_table   :campaigns_users do |t|
      t.references :campaign, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
