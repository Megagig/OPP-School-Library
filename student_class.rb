require_relative 'person_class'

class Student < Person
    attr_reader :classroom
    def initialize(classroom, age, name = 'unknown', parent_permission: true)
        super(age, name, parent_permission: parent_permission)
        @classroom = classroom
      end 
end