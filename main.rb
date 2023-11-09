require_relative 'app'

def list_all_books(app)
    app.list_all_books
  end
  
  def list_all_people(app)
    app.list_all_people
  end

  def create_a_person(app)
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    choice = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    app.create_a_person(choice, name, age)
  end
  
  def create_a_book(app)
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    app.create_a_book(title, author)
  end
  
  def create_a_rental(app)
    app.create_a_rental
  end
  
  def list_all_rentals_for_a_given_person_id(app)
    app.list_all_rentals_for_a_given_person_id
  end

  def display_menu
    puts "
  Please choose an option by entering a number (1-7):
  1 - List all books
  2 - List all people
  3 - Create a person
  4 - Create a book
  5 - Create a rental
  6 - List all rentals for a given person id
  7 - Exit
  "
  end
  
  def main
    app = App.new
    puts 'Welcome to School Library App!'
  
    loop do
      display_menu
      choice = gets.chomp
  
      case choice
      when '1' then list_all_books(app)
      when '2' then list_all_people(app)
      when '3' then create_a_person(app)
      when '4' then create_a_book(app)
      when '5' then create_a_rental(app)
      when '6' then list_all_rentals_for_a_given_person_id(app)
      when '7'
        puts 'Thank you for using this app!'
        break
      else
        puts 'Invalid choice'
      end
    end
  end
  
  main