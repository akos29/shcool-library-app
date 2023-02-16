require 'rspec'
require './teacher'

RSpec.describe Teacher do
  let(:teacher) { Teacher.new(name: 'Jane Doe', age: 35, specialization: 'Mathematics', id: 123) }

  describe '#testing teacher class name, age & specialization' do
    it 'returns the teacher\'s name' do
      expect(teacher.name).to eq('Jane Doe')
    end

    #   describe '#age' do
    it 'returns the teacher\'s age' do
      expect(teacher.age).to eq(35)
    end

    #   describe '#specialization' do
    it 'returns the teacher\'s specialization' do
      expect(teacher.specialization).to eq('Mathematics')
    end
  end
  it 'should not create a teacher when id, age or specialization are missing', negative: true do
    expect { Teacher.new id: 'id', age: 'age' }.to raise_error(ArgumentError)
    expect { Teacher.new age: 'age' }.to raise_error(ArgumentError)
    expect { Teacher.new specialization: 'specialization' }.to raise_error(ArgumentError)
  end
end
