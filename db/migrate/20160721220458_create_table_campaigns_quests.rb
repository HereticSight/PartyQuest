class CreateTableCampaignsQuests < ActiveRecord::Migration
  def change
    create_table :campaigns_quests do |t|
      t.references :campaign, index: true, foreign_key: true
      t.references :quest, index: true, foreign_key: true
    end
  end
end
