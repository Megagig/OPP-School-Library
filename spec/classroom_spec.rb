require 'rspec'
require './classes/student_class'
require './classes/classroom'

describe Student do
  context "Given a Student named Santiago" do
    before :each do
        @classroom = Classroom.new('Gepgraphy')
        @student = Student.new(age: 24, name: 'Santiago', parent_permission: true, classroom: @classroom)
    end

    it 'add_student should asign a clasroom to the student' do
        @classroom.add_student(@student)
        expect(@classroom.students).to include(@student)
    end
  end
end