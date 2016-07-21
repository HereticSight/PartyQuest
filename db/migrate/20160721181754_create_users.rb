class CreateUsers < ActiveRecord::Migration
  def change
    create_table  :users do |t|
      t.string    :username, limit:64, null:false
      t.text      :email, null: false
      t.string    :password_digest, null: false
      t.text      :profile_img
      t.text      :bio, limit: 1000
      t.string    :city, limit: 64
      t.string    :state, limit: 64

      t.timestamps null: false
    end
  end
end
