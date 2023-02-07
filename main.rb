require './person'
require './student'
require './teacher'

person = Person.new(22, 'maximilianus')
p person.correct_name
p capitalized_person = CapitalizeDecorator.new(person)
p capitalized_person.correct_name
p capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
p capitalized_trimmed_person.correct_name