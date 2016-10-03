#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizza.db"

class Product < ActiveRecord::Base
end


get '/' do
@products = Product.all
	erb :index
end

post '/basket' do
@orders = parse_orders params[:orders]
#[["1", "2"], ["2", "1"]]
@orders.each do |item|
item[0] = Product.find(item[0])
end
  erb :basket
end

def parse_orders orders  
# "product_1-2,product_2-1,"
arr2=[]
orders = orders.split(',') 
orders.each do |order|
s1 = order.split('-')
# [product_1,1]
s2 = s1[0].split('_')
# [product,1]
arr1 = [s2[1],s1[1]]
arr2 << arr1 
end
return arr2
end