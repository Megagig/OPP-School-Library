require './student_class'
require './teacher_class'
require './rental'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    if @books.empty?
      puts 'The list of books is empty'
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def list_all_people
    if @people.empty?
      puts 'The list of people is empty'
    else
      @people.each { |person| puts "[#{person.type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
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
    puts 'Please enter the following information:'
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    book = Book.new(title: title, author: author)
    @books.push(book)
    puts 'Book created successfully!'
  end

  # ... (previous code)

  def create_rental
    puts 'Select a book from the following list by number:'
    list_all_books
    book_index = gets.chomp.to_i
    rental_books = @books[book_index]
    puts 'Select a person from the following list by number (not id):'
    list_all_people
    person_index = gets.chomp.to_i
    book_renter = @people[person_index]
    puts 'Date (DD/MM/YYYY):'
    date = gets.chomp
    if book_renter.can_use_services?
      @rentals.push Rental.new(date, rental_books, book_renter)
      puts 'Rental created successfully'
    else
      puts 'Person lacks borrow permissions'
    end
  end

  def rental_list_by_id
    puts 'Rental list by ID: '
    book_renter_id = gets.chomp
    @rentals.each do |rental|
      if rental.person.id == book_renter_id
        puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
      end
    end
  end
end
