class CreateParties < ActiveRecord::Migration
  def change
    create_table    :parties do |t|
      t.string      :name, limit: 128, null: false
      t.text        :invite_link
      t.integer     :leader_id, index: true, null: false

      t.timestamps null: false
    end
  end
end
