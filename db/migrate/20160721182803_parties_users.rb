class PartiesUsers < ActiveRecord::Migration
  def change
    create_table   :parties_users do |t|
      t.references :party, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
