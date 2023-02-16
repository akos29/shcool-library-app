require 'rspec'
require './student'

RSpec.describe Student do
  let(:student) { Student.new(name: 'John Doe', age: 14, parent_permission: true, id: 123) }

  describe '#testing student class name, age, & parent_permission' do
    it 'returns the student\'s name' do
      expect(student.name).to eq('John Doe')
    end

    it 'returns the student\'s age' do
      expect(student.age).to eq(14)
    end

    it 'returns true if the student has parent permission' do
      expect(student.parent_permission).to be true
    end
  end

  describe 'should not create a student when id, age or parent_permission are missing', negative: true do
    it 'raises an error if id is missing' do
      expect { Student.new(age: 14, parent_permission: true) }.to raise_error(ArgumentError)
    end

    it 'raises an error if age is missing' do
      expect { Student.new(id: 123, parent_permission: true) }.to raise_error(ArgumentError)
    end

    it 'raises an error if parent_permission is missing' do
      expect { Student.new(id: 123, age: 14, name: 'John Doe', classroom: '10A') }.to raise_error(ArgumentError)
    end
  end
end
