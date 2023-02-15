require './person'

class Student < Person
  attr_reader :classroom, :parent_permission

  def initialize(id:, age:, name: 'Unknown', parent_permission: true)
    super(id, age, name, parent_permission: parent_permission)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
