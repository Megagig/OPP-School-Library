require_relative 'rental'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, person, self)
  end
  
  def to_json
    {
      title: title,
      author: author,
      rentals: rentals.map(&:to_json)
    }.to_json
 end
end
