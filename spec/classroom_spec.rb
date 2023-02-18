require './classroom'

RSpec.describe 'Classroom' do
  context 'Testing Classroom class' do
    it 'should create a classroom with lable and empty array', positive: true do
      class_room = Classroom.new 'B121 F102'

      expect(class_room).to have_attributes(label: 'B121 F102')
      expect(class_room).to have_attributes(students: [])
    end

    it 'should not create a classroom when lable is empty', negative: true do
      expect { Classroom.new }.to raise_error(ArgumentError)
    end

  end
end
