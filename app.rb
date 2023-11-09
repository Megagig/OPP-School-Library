require_relative 'student_class'
require_relative 'teacher_class'
require_relative 'book'
require_relative 'classroom'
require_relative 'rental'

class App
    attr_accessor :books, :people, :rentals
  
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

      def create_a_book(title, author)
        book = Book.new(title, author)
        @books << book
        puts 'Book created successfully'
      end

      def create_a_rental
        puts 'Select a book from the following list by number'
        list_books
        index_book = gets.chomp.to_i
    
        puts 'Select a person from the following list by number (not id)'
        list_people
        index_person = gets.chomp.to_i
    
        print 'Date: '
        date = gets.chomp
    
        rental = Rental.new(date, @books[index_book], @people[index_person])
        @rentals << rental
        puts 'Rental created successfully'
      end

      def list_all_rentals_for_a_given_person_id
        puts 'ID of person: '
        id = gets.chomp.to_i
    
        puts 'Rentals: '
        @rentals.each do |rental|
          puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
        end
      end

      private

      def create_a_student(name, age)
        print 'Has parent permission? [Y/N]: '
        parent_permission = %w[Y y].include?(gets.chomp)
    
        label = 'math'
        classroom = Classroom.new(label)
        Student.new(classroom, age, parent_permission, name)
      end
    
      def create_a_teacher(name, age)
        print 'Specialization: '
        specialization = gets.chomp
        Teacher.new(specialization, age, name)
      end
    
      def list_books
        @books.each_with_index { |book, index| puts "#{index}) Title \"#{book.title}\", Author: #{book.author}" }
      end
    
      def list_people
        @people.each_with_index do |person, index|
          puts "#{index}) [#{person.type}] Name: #{person.name} ID: #{person.id}, Age: #{person.age}"
        end
      end


end