require_relative 'app'
require_relative 'menu'

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
