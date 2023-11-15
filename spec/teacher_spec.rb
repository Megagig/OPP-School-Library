require 'rspec'
require './classes/teacher_class'

describe Student do
  context "Given a Student named Santiago" do
    before :each do
        @teacher = Teacher.new(age: 35, name: 'Anthony', parent_permission: false, specialization: 'Geography')
    end

    it '@teacher be an instance of Teacher' do
        expect(@teacher).to be_an_instance_of(Teacher)
    end

    it 'can_use_services should return true, as they are a Teacher' do
       expect(@teacher.can_use_services?).to be_truthy
    end
  end
end