require './person.rb'

class Teacher < Person
  def initialize(specialization = 'unknown')
    super()
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
