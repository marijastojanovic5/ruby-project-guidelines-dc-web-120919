 Reader.destroy_all
 Book.destroy_all
 Checkout.destroy_all

 50. times do
    Reader.create(name: Faker::Name.unique.name)
  end
  50. times do
    Book.create(title: Faker::Book.title, author: Faker::Book.author)
  end
 
  lowest_book_id = Book.first.id
  highest_book_id = Book.last.id
  lowest_reader_id = Reader.first.id
  highest_reader_id = Reader.last.id

  

   . times do
    book_id = rand(lowest_book_id..highest_book_id)
    reader_id = rand(lowest_reader_id..highest_reader_id)
    check_out_date = Time.now - (rand(1000000..1100000))
    due_date = check_out_date + 1000000
    return_date =  check_out_date + (rand(100000..1100000))

    Checkout.create(book_id: book_id, reader_id: reader_id, rate: rand(1..5),check_out_date: check_out_date,due_date: due_date,return_date: return_date)
   end

   10. times do
    book_id = rand(lowest_book_id..highest_book_id)
    reader_id = rand(lowest_reader_id..highest_reader_id)
    check_out_date = Time.now - (rand(1000000..1100000))
    due_date = check_out_date + 1000000
    
   Checkout.create(book_id: book_id, reader_id: reader_id, rate: rand(1..5),check_out_date: check_out_date,due_date: due_date)
   end

    