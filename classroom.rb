require './student'
class Classroom
  attr_accessor :label
  attr_reader :classroom, :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student,cr=self)
    @students.push(student)
    Student.classroom = cr
  end
end
