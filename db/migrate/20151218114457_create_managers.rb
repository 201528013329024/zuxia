class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      #t.varchar(20) :manager_id
      #rails 里面的数据库的字段类型有以下几种：
      #:primary_key, :string, :text, :integer, :float,
      #:decimal, :datetime, :timestamp, :time, :date, :binary, :boolean, :references
      t.string :name
      t.string :password
      t.string :email
      t.string :sex
      t.string :academy
      t.string :telephone_number
      t.string :qq_number
      t.string :wechart
      t.string :alipay

      t.timestamps null: false
    end
  end
end
