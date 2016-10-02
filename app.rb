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
@products = Product.all
@hh={}
orders = params[:orders].split(',')
orders.each do |order|
item = order.split('-')
str= item[0]
str=str.delete 'product_'
@hh[str]=item[1]
end

	erb :basket
end