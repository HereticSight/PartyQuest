class RemoveActivityRefFromQuests < ActiveRecord::Migration
  def change
    remove_column :quests, :activity_id
  end
end
