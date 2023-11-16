require_relative 'spec_helper'

RSpec.describe Nameable do
  let(:nameable_instance) { described_class.new }

  describe '#correct_name' do
    it 'raises NotImplementedError' do
      expect do
        nameable_instance.correct_name
      end.to raise_error(NotImplementedError, 'You must implement the correct_name method.')
    end
  end
end
