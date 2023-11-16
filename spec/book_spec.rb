require 'rspec'
require './classes/book'
require './classes/person_class'
require 'json'

describe Book do
  context 'Given a Book named The Sphere by Michael Crichton' do
    before :each do
      @person = Person.new(24, 'Santiago')
      @book = Book.new('Sphere', 'Michael Crichton')
    end

    it '@book should be instance of Book' do
      expect(@book).to be_an_instance_of(Book)
    end

    it '@book title should be Sphere' do
      expect(@book.title).to eql('Sphere')
    end

    it 'add_rental should return an instance of Rental' do
      expect(@book.add_rental('2023-10-29', @person)).to be_an_instance_of(Rental)
    end

    it 'to_json should turn @books into a json file' do
      if File.exist?('book_test.json')
        json = JSON.parse(File.read('book_test.json'))
      else
        File.write('book_test.json', '[]')
        []
      end

      File.write('book_test.json', JSON.pretty_generate(@book))

      expect(@book.title).to eql(json['title'])
    end
  end
end
