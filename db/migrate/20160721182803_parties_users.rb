class PartiesUsers < ActiveRecord::Migration
  def change
    create_table   :parties_users do |t|
      t.references :party, index: true, foreign_key: true, null: false
      t.references :user, index: true, foreign_key: true, null: false
    end
  end
end
