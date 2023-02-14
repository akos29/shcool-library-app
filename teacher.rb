require './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(id:, age:, specialization:, name: 'Unknown')
    @specialization = specialization
    super(id, age, name)
  end

  def can_use_services?
    true
  end
end
