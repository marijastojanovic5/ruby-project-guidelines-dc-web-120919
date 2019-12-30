 Reader.destroy_all
 Book.destroy_all

 50. times do
    Reader.create(name: Faker::Name.unique.name)
  end
  50. times do
    Book.create(title: Faker::Book.title, author: Faker::Book.author)
  end

