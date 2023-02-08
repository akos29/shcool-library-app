require './person'
require './student'
require './teacher'
require './classroom'
require './rental'
require './book'

# person = Person.new(22, 'maximilianus')
# p person.correct_name
# p capitalized_person = CapitalizeDecorator.new(person)
# p capitalized_person.correct_name
# p capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
# p capitalized_trimmed_person.correct_name

p class_a = Classroom.new('117 A')
p class_b = Classroom.new('118 A')

aster = Student.new(age: 35, name: 'Aster', classroom: class_a)
kebede = Student.new(age: 45, name: 'Kebede', classroom: class_b)

p class_a.add_student(aster)
p class_a.add_student(kebede)
p class_a.students.map(&:name)

person = Person.new(22, 'maximilianus')
book = Book.new(title: 'Animal Farm', author: 'George Orwell')
p book1 = Book.new(title: 'The Idiot', author: 'Fyodor Dostoyevsky')

Rental.new(date: '2017-12-22', person: person, book: book)
Rental.new(date: '2017-12-22', person: person, book: book1)
Rental.new(date: '2017-12-22', person: aster, book: book)
Rental.new(date: '2017-12-22', person: kebede, book: book)

p person.rentals.count
p person.rentals.map(&:date)
p book.rentals.count

p aster.rentals.count
aster.rentals.map { |rental| p rental.book.title }
book.rentals.map { |rental| p rental.person.name }
p book.rentals.count
