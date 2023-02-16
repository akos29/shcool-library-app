require './nameable'

class Person < Nameable
  attr_accessor :id, :name, :age, :rentals

  def initialize(id, age, name = 'Unknown', parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  def can_use_services?
    if @parent_permission || of_age?
      true
    else
      false
    end
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end

  def add_rental(date, book)
    rental = Rental.new(date, book, self)
    @rentals << rental
  end
end

class Decorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    @nameable = nameable
    super()
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name[0...10]
  end
end
