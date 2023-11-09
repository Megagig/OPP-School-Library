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

      def list_all_people
        @people.each { |person| puts "[#{person.type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
      end

      def create_a_person(choice, name, age)
        person =
          if choice == '1'
            create_a_student(name, age)
          elsif choice == '2'
            create_a_teacher(name, age)
          else
            puts 'Wrong choice, aborting person creation.'
            return
          end
    
        person.type = person.class.to_s
        @people << person
        puts 'Person created successfully'
      end
end