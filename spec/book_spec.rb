require './book'

describe Book do
  context 'Testing Classroom class' do
    it 'should create a book with Author and Title', positive: true do
      book = Book.new title: 'The Idiot', author: 'Fyodor Dostoevsky'

      expect(book).to have_attributes(title: 'The Idiot')
      expect(book).to have_attributes(author: 'Fyodor Dostoevsky')
    end

    it 'should not create a book without Title or Author', negative: true do
      expect { Book.new 'The Idiot' }.to raise_error(ArgumentError)
    end

    # it 'should add rentals when add_rental method is called' do
    #   book = Book.new title: 'The Idiot', author: 'Fyodor Dostoevsky'

    #   person = double('person')

    #   allow(person).to receive(:id) { 223 }

    #   book.add_rental('2023-01-01', person)

    #   # expect(book).to  be nil
    #   expect(book).to have_attributes(rentals: ['2023-01-01'])
    # end
  end
end
