require './person'
require './student'
require './teacher'
require './classroom'
require './rental'
require './book'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def user_input(text)
    print text
    gets.chomp
  end

  def list_all_books
    if @books.empty?
      puts 'There is no book added'
    else
      @books.each_with_index do |book, index|
        puts "(#{index+1})  Title: #{book.title}, Title: #{book.author}" 
      end
    end
  end

  def list_all_people
    if @people.empty?
      puts 'There is no people added'
    else
      @people.each_with_index do |person, index|
        if person.is_a?(Student)
          puts "(#{index+1}): [Student] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
        else
          puts "(#{index+1}): [Teacher] ID: #{person.id}, Name #{person.name}, Age: #{person.age}"
        end
      end
    end
  end

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
      @people << Student.new(age: age, name: name, parent_permission: permitted)
      puts 'Person [Student] created successfully'
    when 2
      age = user_input('Age:   ')
      name = user_input('Name:  ')
      specialization = user_input('Specialization:  ')
      @people << Teacher.new(age: age, name: name, specialization: specialization)
      puts 'Person [Teacher] created successfully'
    end
  end

  def create_a_book
    title = user_input('Title:  ')
    author = user_input('Author:  ')
    @books << Book.new(title: title, author: author)
    puts 'Book created successfully'
  end

  def create_a_rental
    puts 'Select a book from the following list by number'
    # list all books
    book_choice = gets.chomp
    person_choice = user_input('Select a person from the following list by number (not id): ')

    date = user_input('Date:    ')
    @rentals << Rental.new(date: date, person: person_choice, book: book_choice)
  end

  def list_all_rentals
    person_id = user_input('ID of person:   ')
    puts 'Rentals: '
    @rentals.each_with_index do |rental, index|
      if rental.person.id == person_id
        puts "#{index + 1} Book Title: #{rental.book.title}, Author: #{rental.person.name}"
      end
    end
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
