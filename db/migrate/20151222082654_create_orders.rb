class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :user
      t.integer :route_id
      t.string :ticket_id

      t.timestamps null: false
    end
  end
end
