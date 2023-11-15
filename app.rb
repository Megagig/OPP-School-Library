require './classes/student_class'
require './classes/teacher_class'
require './classes/rental'
require_relative 'manager'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @people = Manager.new('people.json').load_data
    @books = Manager.new('books.json').load_data
    @rentals = Manager.new('rentals.json').load_data
  end

  def save_json
    people_json = Manager.new('people.json')
    people_json.save_data(@people)

    rentals_json = Manager.new('rentals.json')
    rentals_json.save_data(@rentals)

    books_json = Manager.new('books.json')
    books_json.save_data(@books)
  end

  def list_all_books
    if @books.empty?
      puts 'The list of books is empty'
    else
      @books.each_with_index do |book, index|
        puts "#{index} Title: #{book['title'].capitalize}, Author: #{book['author'].capitalize}"
      end
    end
  end

  def list_all_people
    if @people.empty?
      puts 'The list of people is empty'
    else
      @people.each_with_index do |person, index|
        if person.key?('specialization')
          puts "#{index} [Teacher] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
        else
          puts "#{index} [Student] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
        end
      end
    end
  end

  def create_person
    puts 'Do you want to create a student(1) or a teacher(2)? [input the number]:'
    input = gets.chomp

    case input
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Please select one of the options'
    end
  end

  def create_student
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Has parent permission? [y/n]'
    permission = gets.chomp.downcase
    parent_permission = permission == 'y'
    puts 'Classroom'
    classroom = gets.chomp
    @people.push Student.new(age: age, name: name, parent_permission: parent_permission, classroom: classroom)
    puts 'Person created successfully!'
  end

  def create_teacher
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Specialization:'
    specialization = gets.chomp
    parent_permission = true
    @people.push Teacher.new(age: age, name: name, specialization: specialization,
                             parent_permission: parent_permission)
    puts 'Person created successfully!'
  end

  def create_book
    puts 'Enter the Title:'
    title = gets.chomp
    puts 'Enter the Author:'
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully!'
  end

  def create_rental
    puts 'Select a book from the following list by number:'
    list_all_books
    book_index = gets.chomp.to_i
    rented_book = @books[book_index]
    puts 'Select a person from the following list by number (not id)'
    list_all_people
    person_index = gets.chomp.to_i
    renter = @people[person_index]
    puts 'Date (YYYY-MM-DD):'
    date = gets.chomp
    if renter.can_use_services?
      @rentals.push Rental.new(date, rented_book, renter)
      puts 'Rental created successfully'
    else
      puts 'Person lacks borrow permissions'
    end
  end

  def rental_list_by_id
    puts 'ID of person:'
    renter_id = gets.chomp
    renter = @people.select { |person| person.id == renter_id.to_i }
    if renter.empty?
      puts 'No rentals found'
    else
      renter.first.rentals.map do |rental|
        puts "Date: #{rental['date']}, Book: #{rental['book']['title']}, by #{rental['book']['author']}"
      end
    end
  end

  def close
    save_json
  end
end
