require './person'

class Student < Person
  def initialize(name, classroom = 'unknown')
    super(name)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
