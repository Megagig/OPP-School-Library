require_relative 'spec_helper' 

RSpec.describe Decorator do
  let(:nameable_double) { double('Nameable', correct_name: 'John Doe') }
  let(:decorator) { described_class.new(nameable_double) }

  describe '#correct_name' do
    it 'calls correct_name on the underlying nameable object' do
      expect(decorator.correct_name).to eq('John Doe')
    end
  end
end
