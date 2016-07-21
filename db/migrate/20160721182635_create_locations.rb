class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.decimal  :latitude
      t.decimal  :longitude
      t.text     :address
      t.string   :city
      t.string   :state

      t.timestamps null: false
    end
  end
end
