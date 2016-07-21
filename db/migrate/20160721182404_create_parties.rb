class CreateParties < ActiveRecord::Migration
  def change
    create_table    :parties do |t|
      t.string      :name, limit: 128, null:false
      t.text        :invite_link
      t.references  :user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
