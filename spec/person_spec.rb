require 'rspec'
require './classes/person_class'

describe Person do
  context "Given a Person named Santiago, and a book by Michael Crichton" do
    before :each do
      @person = Person.new(24, 'Santiago')
      @book = Book.new('Sphere', 'Michael Crichton')
    end

    it '@person be an instance of Person' do
        expect(@person).to be_an_instance_of(Person)
    end

    it 'id should be between 1 and 1000' do
        expect(@person.id).to be_between(1, 1000).inclusive
    end

    it 'correct_name should return person.name' do
        expect(@person.correct_name).to eql('Santiago')
    end

    it 'of_age should return true' do
        expect(@person.send(:of_age?)).to be true
    end

    it 'can_use_services should return true' do
        expect(@person.can_use_services?).to be_truthy
    end
  end
end