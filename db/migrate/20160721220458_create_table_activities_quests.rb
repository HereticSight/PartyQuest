class CreateTableActivitiesQuests < ActiveRecord::Migration
  def change
    create_table :table_activities_quests do |t|
      t.references :activity, index: true, foreign_key: true, null: false
      t.references :quest, index: true, foreign_key: true, null: false
    end
  end
end
