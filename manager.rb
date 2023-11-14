require 'json'

class Manager
    attr_accessor :books, :people, :rentals

    def initialize
        @books = []
        @people = []
        @rentals = []
    end

    # Single calls?

    def load_data
        load_books
        load_people
        load_rentals
    end

    def save_data
        save_books
        save_people
      save_rentals
    end

    private

    # Loaders

    def load_books
        if File.exists?('books.json')
            @books = File.open('books.json')
        else
            puts 'Theres no saved books!'
        end
    end

    def load_people

    end

    def load_rentals

    end

    # Savers

    def save_books
       @books.each do |book| 
        book.to_s(File.new("books.json", "w"))
        puts 'Book saved succesfully to json'
       end 
    end

    def save_people

    end

    def save_rentals

    end

end