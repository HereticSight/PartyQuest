class CreateQuests < ActiveRecord::Migration
  def change
    create_table  :quests do |t|
      t.string    :name, null: false, limit: 128
      t.text      :description
      t.integer   :price_range, default: 1, limit: 1

      t.timestamps null: false
    end
  end
end
