require './person'
require './student'
require './teacher'
require './classroom'
require './rental'
require './book'
require_relative 'preservepeople'
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

  def validate_age(age)
    age.is_a? Numeric
  end

  def list_all_books
    if @books.empty?
      puts 'There is no book added'
    else
      @books.each_with_index do |book, index|
        puts "(#{index + 1})  Title: #{book.title}, Title: #{book.author}"
      end
    end
  end

  def list_all_people
    if @people.empty?
      puts 'There is no people added'
    else
      @people.each_with_index do |person, index|
        if person.is_a?(Student)
          puts "(#{index + 1}): [Student] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
        else
          puts "(#{index + 1}): [Teacher] ID: #{person.id}, Name #{person.name}, Age: #{person.age}"
        end
      end
    end
  end

  def create_a_person
    puts 'Do you want to create a student(1) or a teacher (2)?'
    choice = user_input('[Input the number]:  ')
    case choice.to_i
    when 1
      age = user_input('Age:   ').to_i
      name = user_input('Name:   ')
      permission = user_input('Has parent permission? [Y/N]:  ')
      permitted = %w[y Y].include?(permission)
      if validate_age(age)
        @people << Student.new(id: Random.rand(1..1000), age: age, name: name, parent_permission: permitted)
      end
    when 2
      age = user_input('Age:   ')
      name = user_input('Name:  ')
      specialization = user_input('Specialization:  ')
      if validate_age(age)
        p @people << Teacher.new(id: Random.rand(1..1000), age: age, name: name, specialization: specialization,
                                 parent_permission: true)
      end
    else
      create_a_person
    end
    puts 'Person created successfully'
    # PreservePeople.new.save_people(@people)
  end

  def create_a_book
    title = user_input('Title:  ')
    author = user_input('Author:  ')
    @books << Book.new(title: title, author: author)
    puts 'Book created successfully'
  end

  def create_a_rental
    if @people.empty?
      puts 'Please add at least 1 person to continue'
      create_a_person
    end
    if @books.empty?
      puts 'Please add at least one book to continue'
      create_a_book
    end
    list_all_books
    book_choice = user_input('Your selection:   ').to_i
    book = @books[book_choice - 1]
    puts book.title
    puts 'Select a person from the following list by number (not id):'
    list_all_people
    person_choice = user_input('Your selection:   ').to_i
    person = @people[person_choice - 1]
    puts person.name
    date = user_input('Date(YYYY-MM-DD):   ')

    @rentals << Rental.new(date: date, person: person, book: book)
    puts 'Rental added sucessfully'
  end

  def list_all_rentals
    list_all_people
    person_id = user_input('ID of person:   ').to_i
    puts 'Rentals: '
    @rentals.each_with_index do |rental, index|
      if rental.person.id == person_id
        puts "#{index + 1} Book Title: #{rental.book.title}, Rented by: #{rental.person.name}"
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
      puts '*' * 60
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
