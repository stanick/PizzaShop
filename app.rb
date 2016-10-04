#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizza.db"

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
	validates :username, presence: true, length: { minimum: 3 }
	validates :phone, presence: true
	validates :address, presence: true

end


get '/' do
@products = Product.all
	erb :index
end

post '/basket' do
@orders_input = params[:orders]
@orders = parse_orders @orders_input

if @orders.empty?
 return erb "Ваша корзина пуста!"
end

@orders.each do |item|
item[0] = Product.find(item[0])
end
  erb :basket
end


post '/place_orders' do
@order = params[:order]
	@o = Order.new params[:order]
	if @o.save

		erb :place_orders
	else
		@error = @o.errors.full_messages.first
		erb "ERROR"
	end

end

def parse_orders orders  
arr2=[]
orders = orders.split(',') 
orders.each do |order|
s1 = order.split('-')
s2 = s1[0].split('_')
arr1 = [s2[1],s1[1]]
arr2 << arr1 
end
return arr2
end