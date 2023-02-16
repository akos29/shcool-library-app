require './classroom'

describe Classroom do
  context 'Testing Classroom class' do
    it 'should create a classroom with lable and empty array', positive: true do
      class_room = Classroom.new 'B121 F102'

      expect(class_room).to have_attributes(label: 'B121 F102')
      expect(class_room).to have_attributes(students: [])
    end

    it 'should not create a classroom when lable is empty', negative: true do
      expect { Classroom.new }.to raise_error(ArgumentError)
    end

    it 'should add rentals when add_rental method is called' do
      # book = Book.new title: 'The Idiot', author: 'Fyodor Dostoevsky'

      # person = double('person')

      # allow(person).to receive(:id) { 223 }

      # book.add_rental('2023-01-01', person)

      # # expect(book).to  be nil
      # expect(book).to have_attributes(rentals: ['2023-01-01'])
    end
  end
end
