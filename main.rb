require_relative 'app'
def main
  app = App.new
  puts 'Welcome to School Library App!'
  puts ''

  loop do
    show_menu
    option = gets.chomp
    if option == '7'
      puts 'Thank you for using this app!'
      break
    else
      process_option(option, app)
    end
  end
end

def show_menu
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
  puts ' '
  puts 'Enter number: '
end

def process_option(option, app)
  case option
  when '1'
    app.list_all_books
  when '2'
    app.list_all_people
  when '3'
    app.create_person
  when '4'
    app.create_book
  when '5'
    app.create_rental
  when '6'
    app.rental_list_by_id
  end
end

main
