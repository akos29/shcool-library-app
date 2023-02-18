require './rental'

RSpec.describe Rental do
  let(:rental) { Rental.new(date: '2023-02-16', person: 1, book: 'Book title') }

  it 'has a date', positive: true do
    expect(rental.date).to eq('2023-02-16')
  end

  it 'has a person id', positive:true do
    expect(rental.person).to eq(1)
  end

  it 'has a book title', positive:true do
    expect(rental.book).to eq('Book title')
  end

  context 'when creating a rental', negative:true do
    it 'raises an error if the date is missing' do
      expect { Rental.new(person: 1, book: 'Book title') }.to raise_error(ArgumentError)
    end

    it 'raises an error if the person id is missing', negative:true do
      expect { Rental.new(date: '2023-02-16', book: 'Book title') }.to raise_error(ArgumentError)
    end

    it 'raises an error if the book title is missing', negative:true do
      expect { Rental.new(date: '2023-02-16', person: 1) }.to raise_error(ArgumentError)
    end
  end
end
