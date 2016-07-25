class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.float  :latitude
      t.float  :longitude
      t.text     :address

      t.timestamps null: false
    end
  end
end
