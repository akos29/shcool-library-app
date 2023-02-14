require 'json'
require './student'

class PreservePeople
  def initialize
    @persons = []
  end

  def save_people(people)
    people.map do |person|
      @persons << if person.instance_of?(Teacher)
                    { id: person.id, name: person.name, age: person.age, parent_permission: true,
                      specialization: person.specialization }
                  else
                    { id: person.id, name: person.name, age: person.age, parent_permission: person.parent_permission }
                  end
    end

    # json =JSON.pretty_generate(persons)

    File.write('people.json', JSON.pretty_generate(@persons), mode: 'w')

    p JSON.pretty_generate(@persons)
    # file.puts JSON.pretty_generate(@persons)
    # file.close
  end
end
