require './person'
require './student'
require './teacher'
require './classroom'
require './rental'
require './book'

class App
  def initialize
    @people = []
    @book = []
    @rentals = []
  end

  def user_input(text)
    print text
    gets.chomp
  end

  def list_all_books; end

  def list_all_people; end

  def create_a_person
    puts 'Do you want to create a student(1) or a teacher (2)?'
    choice = user_input('[Input the number]:  ')
    case choice.to_i
    when 1
      # Create a student
      
      age = user_input('Age:   ').to_i
      name = user_input('Name:   ')
      permission = user_input('Has parent permission? [Y/N]:  ')
      permitted = %w[y Y].include?(permission)
      Student.new(age: age, name: name, parent_permission: permitted)
    when 2
      # create a teacher
      puts 'Age: '
      age = gets.chomp
      puts 'Name: '
      name = gets.chomp
      puts 'Specialization : '
      specialization = gets.chomp
      new_teacher = Teacher.new(age: age, name: name, specialization: specialization)
      unless new_teacher? nil
        puts 'Person created successfully'
        new_teacher
      end
    end
  end

  def create_a_book
    # create a book
    puts 'Title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp
    new_book = Book.new(title: title, author: author)
    return if new_book? nil

    puts 'Person created successfully'
  end

  def create_a_rental
    puts 'Select a book from the following list by number'
    # list all books
    book_choice = gets.chomp
    puts 'Select a person from the following list by number (not id)'
    person_choice = gets.chomp

    puts 'Date: '
    date = gets.chomp
    new_rental = Rental.new(date: date, person: person_choice, book: book_choice)
  end

  def list_all_rentals
    puts 'ID of person: '
    person_id = gets.chomp
    puts 'Rentals: '
  end

  def operation(input)
    case input
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_a_person
    when 4
      create_a_book
    when 5
      create_a_rental
    when 6
      list_all_rentals
    else
      puts 'Please choose a valid option number'
    end
  end

  def run
    puts 'Welcome to School Library App!'
    loop do
      puts '*' * 50
      puts '
          1- List all books
          2- List all people
          3- Create a new person
          4- Create a new book entry
          5- Create a new rental entry
          6- List all rentals for a given person id
          7- Quit'

      input = user_input('Choose an option: ').to_i

      break if input == 7

      operation(input)
    end
  end
end


# person = Person.new(22, 'maximilianus')
# p person.correct_name
# p capitalized_person = CapitalizeDecorator.new(person)
# p capitalized_person.correct_name
# p capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
# p capitalized_trimmed_person.correct_name

# class_a = Classroom.new('117 A')
# class_b = Classroom.new('118 A')

# aster = Student.new(age: 35, name: 'Aster', classroom: class_a)
# kebede = Student.new(age: 45, name: 'Kebede', classroom: class_b)

# class_a.add_student(aster)
# class_a.add_student(kebede)
# class_a.students.map(&:name)

# person = Person.new(22, 'maximilianus')
# book = Book.new(title: 'Animal Farm', author: 'George Orwell')
# p book1 = Book.new(title: 'The Idiot', author: 'Fyodor Dostoyevsky')

# Rental.new(date: '2017-12-22', person: person, book: book)
# Rental.new(date: '2017-12-22', person: person, book: book1)
# Rental.new(date: '2017-12-22', person: aster, book: book)
# Rental.new(date: '2017-12-22', person: kebede, book: book)

# p person.rentals.count
# p person.rentals.map(&:date)
# p book.rentals.count

# p aster.rentals.count
# aster.rentals.map { |rental| p rental.book.title }
# book.rentals.map { |rental| p rental.person.name }
# p book.rentals.count
