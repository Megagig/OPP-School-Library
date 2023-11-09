require relative 'student_class'
require relative 'teacher_class'
require relative 'book'
require relative 'classroom'
require relative 'rental'

class App
    attr_accessor :books, :people, :rentals
  
    def initialize
      @people = []
      @books = []
      @rentals = []
    end
end