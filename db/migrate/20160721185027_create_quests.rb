class CreateQuests < ActiveRecord::Migration
  def change
    create_table    :quests do |t|
      t.string      :name, limit: 64, null: false
      t.references  :location, index: true, foreign_key: true
      t.references  :activity, index: true, foreign_key: true, null: false
      t.references  :party, index: true, foreign_key: true
      t.datetime    :start_time, null: false

      t.timestamps null: false
    end
  end
end
