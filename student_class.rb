require_relative 'person_class'

class Student < Person
  # attr_reader :classroom
  attr_accessor :classroom

  def initialize(classroom:, age:, parent_permission:, name: 'unknown')
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def add_classroom(classroom)
    # @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
