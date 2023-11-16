require 'rspec'
require './classes/book'
require './classes/person_class'

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
  end
end
