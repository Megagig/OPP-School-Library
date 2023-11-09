require relative 'student_class'
require relative 'teacher_class'
require relative 'book'
require relative 'classroom'
require relative 'rental'

class App
    # attr_accessor :books, :people, :rentals
  
    def initialize
      @people = []
      @books = []
      @rentals = []
    end

    def list_all_books
        @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
      end  
end