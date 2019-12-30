 Reader.destroy_all
 Book.destroy_all

 50. times do
    Reader.create(name: Faker::Name.unique.name)
  end
  50. times do
    Book.create(title: Faker::Book.title, author: Faker::Book.author)
  end
 
    Checkout.create(book_id: 1, reader_id: 34)
    Checkout.create(book_id: 2, reader_id: 67)
    Checkout.create(book_id: 3, reader_id: 23)
    Checkout.create(book_id: 4, reader_id: 11)
    Checkout.create(book_id: 5, reader_id: 57)
    Checkout.create(book_id: 6, reader_id: 79)
    Checkout.create(book_id: 7, reader_id: 22)
    Checkout.create(book_id: 8, reader_id: 90)
    Checkout.create(book_id: 9, reader_id: 25)
    Checkout.create(book_id: 10, reader_id: 48)
    Checkout.create(book_id: 11, reader_id: 16)
    Checkout.create(book_id: 12, reader_id: 4)
    Checkout.create(book_id: 13, reader_id: 9)
    Checkout.create(book_id: 14, reader_id: 62)
    Checkout.create(book_id: 15, reader_id: 99)
    Checkout.create(book_id: 16, reader_id: 44)
    Checkout.create(book_id: 17, reader_id: 31)
    Checkout.create(book_id: 18, reader_id: 62)
    Checkout.create(book_id: 19, reader_id: 55)
    Checkout.create(book_id: 20, reader_id: 2)
    Checkout.create(book_id: 21, reader_id: 27)
    Checkout.create(book_id: 22, reader_id: 21)
    Checkout.create(book_id: 23, reader_id: 39)
    Checkout.create(book_id: 24, reader_id: 93)
    Checkout.create(book_id: 25, reader_id: 87)
    Checkout.create(book_id: 26, reader_id: 81)
    Checkout.create(book_id: 27, reader_id: 100)
    Checkout.create(book_id: 28, reader_id: 12)
    Checkout.create(book_id: 29, reader_id: 36)
    Checkout.create(book_id: 30, reader_id: 59)
    Checkout.create(book_id: 31, reader_id: 88)
    Checkout.create(book_id: 32, reader_id: 1)

  

