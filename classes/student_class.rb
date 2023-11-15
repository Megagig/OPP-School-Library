require_relative 'person_class'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom:, age:, parent_permission:, name: 'unknown')
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def add_classroom(classroom)
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def to_json(*_args)
    {
      'id' => id,
      'age' => @age,
      'name' => @name,
      'parent_permission' => @parent_permission,
      'classroom' => @classroom
    }.to_json
  end
end
