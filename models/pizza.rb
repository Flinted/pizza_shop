require ('pry-byebug')
require ('pg')

class Pizza

    attr_reader(:first_name,:last_name,:topping,:quantity)

    def initialize(options)
      @first_name = options["first_name"]
      @last_name  = options["last_name"]
      @topping    = options["topping"]
      @quantity   = options["quantity"].to_i
    end



end

binding.pry
nil