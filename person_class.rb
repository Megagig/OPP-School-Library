class Person 
     # Constructor with instance variables
     def initialize(name = 'unknown', age = nil, parent_permission: true)
        @id = generate_id
        @name = name
        @age = age
        @parent_permission = parent_permission
     end

       # Getters and setters

       attr_accessor :name, :age
       attr_reader :i

       # Private method of_age? that returns true if @age is greater or equal to 18 and false otherwise.
       
       private
         def of_age? 
            @age >= 18
         end

          

  
end