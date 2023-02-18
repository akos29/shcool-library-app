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

  end
end
