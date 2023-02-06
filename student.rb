require './person.rb'

class Student < Person
  def initialize(classroom = 'unknown')
    super()
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
