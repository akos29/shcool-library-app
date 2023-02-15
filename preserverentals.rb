require 'json'

module PreserveRentals
  def saverentals(rentals)
    rentals_array = []
    rentals_path = 'rentals.json'

    return unless File.exist?(rentals_path)

    rentals.map do |rental|
      rentals_array << { date: rental.date, person: rental.person.name, book: rental.book.title }
    end

    File.write(rentals_path, JSON.generate(rentals_array))
  end

  def fetchrentals
    data = []
    rentals_path = 'rentals.json'

    return data if File.zero?(rentals_path)

    JSON.parse(File.read(rentals_path)).each do |rental|
      data << Rental.new(date: rental['date'], person: rental['person'], book: rental['book'])
    end
  end
end
