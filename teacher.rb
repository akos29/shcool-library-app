require './person'

class Teacher < Person
  def initialize(name, specialization = 'unknown')
    super(name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
