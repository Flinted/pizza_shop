require ('pry-byebug')
require ('pg')

class Pizza

    attr_reader(:first_name,:last_name,:topping,:quantity, :id)

    def initialize(options)
      @id =    options['id']
      @first_name = options['first_name']
      @last_name  = options['last_name']
      @topping    = options['topping']
      @quantity   = options['quantity'].to_i
    end

    def save()
      db =  PG.connect({dbname:'pizza_shop', host: 'localhost'})
      sql = "INSERT INTO 
        pizzas (
        first_name,
        last_name,
        topping,
        quantity) 
        VALUES (
        '#{@first_name}',
        '#{@last_name}',
        '#{@topping}',
        '#{@quantity}'
        ) returning *" 
      result = db.exec(sql)
      @id = result[0]['id']
      db.close
    end

    # def self.orders()
    #   db =  PG.connect({dbname:'pizza_shop', host: 'localhost'})
    #   sql = "SELECT pizzas.topping, SUM(pizzas.quantity) as No_ordered FROM pizzas GROUP BY pizzas.topping;" 
    #   return_info = db.exec(sql)
    #   return_info.each {|entry| puts "We have #{entry["no_ordered"]} #{entry["topping"]} on order"}
    #   db.close
    # end

    def self.update_by_id(id, topping)
      @topping = topping
      db =  PG.connect({dbname:'pizza_shop', host: 'localhost'})
      sql = "UPDATE pizzas SET topping = '#{@topping}' WHERE id = #{id}" 
      db.exec(sql)
      db.close
    end

    def update_topping(topping)
      @topping = topping
      db =  PG.connect({dbname:'pizza_shop', host: 'localhost'})
      sql = "UPDATE pizzas SET topping = '#{@topping}' WHERE id = #{@id}" 
      db.exec(sql)
      db.close
    end

    def self.delete_by_id(id)
      db =  PG.connect({dbname:'pizza_shop', host: 'localhost'})
      sql = "DELETE FROM  
        pizzas WHERE id = #{id}" 
      db.exec(sql)
      db.close
    end        

    def self.cancel_order_by_user(name)
      db =  PG.connect({dbname:'pizza_shop', host: 'localhost'})
      sql = "DELETE FROM  
        pizzas WHERE first_name = '#{name}'" 
      db.exec(sql)
      db.close
    end        

    def self.cancel_pizza_by_user(name,pizza_name)
      db =  PG.connect({dbname:'pizza_shop', host: 'localhost'})
      sql = "DELETE FROM  
        pizzas WHERE first_name = '#{name}' AND topping = '#{pizza_name}'" 
      db.exec(sql)
      db.close
    end        


    def self.all()
      db =  PG.connect({dbname:'pizza_shop', host: 'localhost'})
      sql = "SELECT * FROM pizzas"
      pizzas = db.exec(sql)
      db.close
      pizza_array = pizzas.map {|pizza| Pizza.new(pizza)}
      return pizza_array
    end

end

pizza2 = Pizza.new({'first_name' => "Jay", 'last_name' => "Chetty", 'topping' => "Calzone", 'quantity' => 2})

Pizza.all()
# binding.pry
# nil