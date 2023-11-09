require_relative 'person_class'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    classroom.add_student(self) if @classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
