class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table    :campaigns do |t|
      t.string      :name, limit: 128, null: false
      t.text        :invite_link
      t.integer     :leader_id, index: true, null: false
      t.datetime    :start_time
      t.datetime    :end_time
      t.integer     :location_id, index: true

      t.timestamps null: false
    end
  end
end
