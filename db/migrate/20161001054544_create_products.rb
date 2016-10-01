class CreateProducts < ActiveRecord::Migration
  def change
  create_table :products do |t|
  t.text :title
  t.integer :size
  t.decimal :price
  t.boolean :is_best_offer
  t.string :path_to_image
  t.timestamps
  end
  Product.create({
        :title => 'Маргарита',
	:size => 36,
	:price => 135,
	:is_best_offer => false,
	:path_to_image => 'images/margo.png'
	})

  Product.create({
        :title => 'Пепперони с томатами',
	:size => 36,
	:price => 150,
	:is_best_offer => false,
	:path_to_image => 'images/papperoni.png'
	})

  Product.create({
        :title => 'Пицца Техас',
	:size => 36,
	:price => 142,
	:is_best_offer => false,
	:path_to_image => 'images/texas.png'
	})

  end
end
