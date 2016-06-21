require_relative '../models/pizza.rb'
require_relative '../models/sales.rb'
require 'pry-byebug'



  pizzas = Pizza.all()
  sales = Sales.new(pizzas)


  binding.pry
  nil

