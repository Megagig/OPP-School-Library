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
            return unless File.exist?('books.json')
            json_str = File.read('books.json')
            @books = JSON.parse(json_str).map do |book_data|
              Book.new(book_data['title'], book_data['author'])
            end
          end
        end

    def load_people

    end

    def load_rentals

    end

    # Savers

    def save_books
     file.open('books.json', 'w') do |file|
        file.puts @books.map {|book|
         'title' => book.title,
         'author' => book.author
        }.to_json
          
        end
     end

    def save_people

    end

    def save_rentals

    end

end