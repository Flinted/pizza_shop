require_relative ('pizza')
require 'pry-byebug'
class Sales
  attr_reader :orders

  def initialize(pizzas)
    @pizzas =pizzas
    @orders = {}
  end

  def total_revenue()
    total = 0
    @pizzas.each {|pizza| total += pizza.quantity * 10}
    return total
  end

  def refund(first_name, topping)
    total = 0
    @pizzas.each { |pizza| total += (pizza.quantity * 10) if (pizza.first_name == first_name) && (pizza.topping == topping)}
    return total
  end

  # def orders()

  #   @pizzas.each {|pizza| @orders[pizza.topping] =  pizza.quantity}
  #   @orders each
  #   binding.pry
  #   nil
  # end


end
