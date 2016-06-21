require ('pry-byebug')
require ('pg')

class Pizza

    attr_reader(:first_name,:last_name,:topping,:quantity)

    def initialize(options)
      @first_name = options["first_name"]
      @last_name  = options["last_name"]
      @topping    = options["toppings"]
      @quantity   = options["quantity"].to_i
    end

    def save()
      db =  PG.connect({dbname:'pizza_shop', host: 'localhost'})
      sql = "INSERT INTO 
        pizzas (
        first_name,
        last_name,
        toppings,
        quantity) 
        VALUES (
        '#{@first_name}',
        '#{@last_name}',
        '#{@topping}',
        '#{@quantity}'
        )" 
      db.exec(sql)
      db.close
    end

    def self.all()
      db =  PG.connect({dbname:'pizza_shop', host: 'localhost'})
      sql = "SELECT * FROM pizzas"
      pizzas = db.exec(sql)
      db.close
      # pizza_array = []
      # for pizza in pizzas
      #   pizza_array << Pizza.new(pizza)
      # end
      # puts pizza_array
      
      pizza_array = pizzas.map {|pizza| Pizza.new(pizza)}
      puts pizza_array
    end
end

pizza1 = Pizza.new({"first_name" => "Obiwan", "last_name" => "Kenobe", "topping" => "Napoli", "quantity" => 1})
pizza2 = Pizza.new({"first_name" => "Luke", "last_name" => "Skywalker", "topping" => "Calzone", "quantity" => 5})

Pizza.all()
binding.pry
nil