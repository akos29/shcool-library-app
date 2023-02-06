class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(name, age = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    if @parent_permission || of_age?
      true
    else
      false
    end
  end

  private

  def of_age?
    @age >= 18
  end
end
