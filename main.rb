require './person'
require './student'
require './teacher'

person1 = Person.new( 54,'Kibre', parent_permission: false)
person2 = Person.new( 17, 'Abebe',  parent_permission: true)

p person1.can_use_services?
p person2.can_use_services?

student = Student.new(age: 27,classroom: 'class B')

p student.play_hooky

teacher = Teacher.new(age: 37, specialization:'Class A')

p teacher.can_use_services?
