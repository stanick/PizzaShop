class CreateOrders < ActiveRecord::Migration
  def change

  create_table :orders do |t|
  t.text :username
  t.text :phone
  t.text :address
  t.text :orders

  t.timestamps
  end

  end
end
