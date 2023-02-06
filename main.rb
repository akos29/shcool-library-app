require "./person.rb"

person1 = Person.new('Kibre',21)
person2 = Person.new('Abebe')

p person1.can_use_services?
p person2.can_use_services?