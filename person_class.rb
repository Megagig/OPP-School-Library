class Person 
     # Constructor with instance variables
     def initialize(name = 'unknown', age = nil, parent_permission: true)
        @id = generate_id
        @name = name
        @age = age
        @parent_permission = parent_permission
     end
end