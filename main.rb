require './person'
require './student'
require './teacher'

person1 = Person.new('Kibre', 21, parent_permission: false)
person2 = Person.new('Abebe')

p person1.can_use_services?
p person2.can_use_services?

student = Student.new('Kebede')

p student.play_hooky

teacher = Teacher.new('Kebede', 'Class A')

p teacher.can_use_services?
