class CreateTableActivitiesQuests < ActiveRecord::Migration
  def change
    create_table :activities_quests do |t|
      t.references :activity, index: true, foreign_key: true
      t.references :quest, index: true, foreign_key: true
    end
  end
end
