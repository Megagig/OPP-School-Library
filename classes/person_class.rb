require_relative 'nameable'

class Person < Nameable
  # Getters and setters
  attr_accessor :name, :age, :type
  attr_reader :id, :rentals

  # Constructor with instance variables
  def initialize(age = nil, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
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
  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age.to_i >= 18
  end
end
