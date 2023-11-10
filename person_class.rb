require_relative 'nameable'
class Person < Nameable
  # Getters and setters
  attr_accessor :name, :age, :type
  attr_reader :id, :rentals

  # Constructor with instance variables
  def initialize(name = 'unknown', age = nil, parent_permission: true)
    @id = generate_id
    @name = name
    @age = age.to_i
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  def add_rental(book, date)
    Rental.new(date, self, book)
  end
  # Turn person into nameable from class Nameable

  def correct_name
    @name
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
