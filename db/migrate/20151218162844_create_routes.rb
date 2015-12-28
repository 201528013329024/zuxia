class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :start_end
      t.datetime :drive_data
      t.string :drive_time
      t.integer :ticket_num
      t.float :price
      t.string :bus_id

      t.timestamps null: false
    end
  end
end
