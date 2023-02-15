require 'json'

module PreserveBooks
  def save_books(books)
    books_arr = []
    books_path = 'books.json'

    return unless File.exist?(books_path)

    books.map do |book|
      books_arr << { title: book.title, author: book.author }
    end

    File.write(books_path, JSON.pretty_generate(books_arr))
  end

  def fetch_books
    data = []
    books_path = 'books.json'

    return data if File.zero?(books_path)

    JSON.parse(File.read(books_path)).each do |book|
      data << Book.new(title: book['title'], author: book['author'])
    end

    data
  end
end
