class Person
  # Getters and setters
  attr_accessor :name, :age
  attr_reader :id

  # Constructor with instance variables
  def initialize(name = 'unknown', age = nil, parent_permission: true)
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end



  # Private method of_age? that returns true if @age is greater or equal to 18 and false otherwise.

  private

  def of_age?
    @age >= 18
  end
  # Public method can_use_services? that returns true if person is of age or if they have permission from parents.

  public

  def can_use_services?
    of_age? || @parent_permission
  end
  #  method that generate id randomly

  def generate_id
    rand(1_000..9_999)
  end
end
