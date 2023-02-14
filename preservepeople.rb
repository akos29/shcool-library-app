require 'json'
require 'stringio'
require './student'


module PreservePeople
  def save_people(people)
    students = []
    teachers = []
    students_path = 'people.json'
    teachers_path = 'teachers.json'

    return unless File.exist?(students_path) && File.exist?(teachers_path)

    people.map do |person|
      case person
      when Teacher
        teachers << { id: person.id, name: person.name, age: person.age, parent_permission: true,
                      specialization: person.specialization }
      when Student
        students << { id: person.id, name: person.name, age: person.age, parent_permission: person.parent_permission }
      end
    end

    File.write(students_path, JSON.pretty_generate(students))
    File.write(teachers_path, JSON.pretty_generate(teachers))
  end

  def fetch_people
    data = []
    students_path = 'people.json'
    teachers_path = 'teachers.json'

    unless (File.exist?(students_path) && File.exist?(teachers_path)) && (File.read(students_path) != '' && File.read(teachers_path) != '')
      return data
    end

    JSON.parse(File.read(teachers_path)).each do |teacher|
      data << Teacher.new(id: teacher['id'], age: teacher['age'], name: teacher['name'],
                          parent_permission: teacher['parent_permission'], specialization: teacher['specialization'])
    end

    JSON.parse(File.read(students_path)).each do |student|
      data << Student.new(id: student['id'], age: student['age'], name: student['name'],
                          parent_permission: student['parent_permission'])

      data
    end
  end
end
