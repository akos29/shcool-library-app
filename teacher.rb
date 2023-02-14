require './person'

class Teacher < Person
  attr_reader :specialization

  def initialize(id:, age:, specialization:, name: 'Unknown', parent_permission: true)
    @specialization = specialization
    super(id, age, name, parent_permission: parent_permission)
  end

  def can_use_services?
    true
  end
end
