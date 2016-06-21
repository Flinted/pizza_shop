require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../sales')

class TestSales < MiniTest::Test

  def setup
    pizza1 = Pizza.new({'first_name' => "Val", 'last_name' => "Gibson", 'topping' => "Milk", 'quantity' => 4})
    pizza2 = Pizza.new({'first_name' => "Jay", 'last_name' => "Chetty", 'topping' => "Calzone", 'quantity' => 2})
    pizza3 = Pizza.new({'first_name' => "Joe", 'last_name' => "Chetty", 'topping' => "Calzone", 'quantity' => 2})
    @sales = Sales.new( [ pizza1,pizza2, pizza3 ] )
  end

  def test_total_revenue()
    result = @sales.total_revenue
    assert_equal(80, result)
  end

  def test_refund()
    result = @sales.refund("Val", "Milk")
    assert_equal(40, result)
  end

  def test_orders()
    assert_equal(2, @sales.orders.size)
  end




end