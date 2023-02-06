require './person'
require './student'

person1 = Person.new('Kibre', 21, false)
person2 = Person.new('Abebe')

p person1.can_use_services?
p person2.can_use_services?

student = Student.new('Kebede')

p student.play_hooky
