require './person'
require './student'
require './teacher'

person1 = Person.new(54, 'kibrewossen yitbarek', parent_permission: false)
person2 = Person.new(17, 'abebe kebede', parent_permission: true)

capPer1= CapitalizeDecorator.new( person1)
p capPer1.correct_name
p person2.can_use_services?

student = Student.new(age: 27, classroom: 'class B')

p student.play_hooky

teacher = Teacher.new(age: 37, specialization: 'Class A')

p teacher.can_use_services?
