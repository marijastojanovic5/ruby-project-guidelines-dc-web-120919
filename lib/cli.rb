def welcome
    puts "
           Welcome to our Library
     __...--~~~~~-._   _.-~~~~~--...__
    //               `V'               \\ 
   //    Marija       |     Dean        \\ 
  //__...--~~~~~~-._  |  _.-~~~~~~--...__\\ 
 //__.....----~~~~._\  | /_.~~~~----.....__\\
====================\\ |//====================
                    `---`
 ".red
 help
   
end
def help
     help = <<-HELP
     Please choose one of the following:\n
      Book by \n
      -author : displays all the books by authors
      -title  : displays all the books by title
      -genre : displays all the genres
      -highest rating : displays book with max rating
      -lowest rating  : displays book with min rating
      -top authors : displays most popular authors 
      -exit : exits the app
    HELP
  puts help.yellow
  run
end

def option
    options = <<-OPTIONS
  
  Please type one of the following:
  - ? : check book availability
  - main menu : go back to main menu
  - exit : exit the app

  OPTIONS
   puts options.green
  
end
 
def title_by_author
   all_authors
   puts "\nPlease type the number of the author to see the title:\n".blue
    author = book_choosing_by_author
     option
     author_menu(author)
     back_to_start
   run
end

def back_to_start
    start = <<-OPTIONS
  
  Please type one of the following:
  - main menu : go back to main menu
  - exit : exit the app

  OPTIONS
   puts start.green
end
def back_to_start_2
    start2 = <<-OPTIONS

    Please type one of the following:\n
  - title : check the titles for the chosen authors
  - main menu : go back to main menu
  - exit : exit the app

  OPTIONS
  puts start2.green

end

def book_choosing_by_author
    user_input = gets.chomp
    if (user_input.to_i) <= Book.all.count
      chosen_author = Book.all[user_input.to_i - 1]
      puts "\n"
      puts chosen_author.author
      puts "**** wrote ****".blue
      puts chosen_author.title
      return chosen_author
      puts "\n"
    else
    all_authors
    puts "\nInvalid input, please try again.\n".blue
    book_choosing_by_author
    end
end

def book_choosing_by_title
    user_input = gets.chomp
    
    if (user_input.to_i) <= Book.all.count
      chosen_author = Book.all[user_input.to_i - 1]
      puts "\n"
      puts chosen_author.title
      puts "**** by ****".blue
      puts chosen_author.author
      return chosen_author
      puts "\n"
    else
    all_titles
    puts "\nInvalid input, please try again.\n".red
    book_choosing_by_title
    end
end

def author_by_title
    all_titles
    puts "\nPlease type the number of the title to see the author:\n".blue
    puts "\n"
    title = book_choosing_by_title
     option
    title_menu(title)
    back_to_start
    run
end

def author_menu(author)
    command = gets.downcase.strip
    case command
    when "?"
       is_availabile(author)
    when 'main menu'
        help
      when 'exit'
        exit_app
      else
        option
    end
end

def title_menu(title)
    command = gets.downcase.strip
    case command
    when "?"
       is_availabile(title)
    when 'main menu'
        help
      when 'exit'
        exit_app
      else
        option
    end
end

def all_authors
    Book.all.each_with_index {|book, index|
    puts "#{index+1}. #{book.author}"}
end

def all_titles
    Book.all.each_with_index {|book, index|
    puts "#{index+1}. #{book.title}"}
end
def all_genres
    Genre.all.each_with_index {|genre, index|
    puts "#{index+1}. #{genre.name}"}
end

def chosen_boooksssss
    all_genres
    puts "\nPlease type the number of the genre to see the books:\n".blue
    book_choosing_by_genre
    back_to_start
    run
end
 def book_choosing_by_genre
    user_input = gets.chomp
    if (user_input.to_i) <= all_genres.count
      chosen_genre = all_genres[user_input.to_i - 1]
      book_title_by_genre = chosen_genre.books.map {|book|book.title}
      puts "\n"
      puts  book_title_by_genre
    else
    all_genres
    puts "\nInvalid input, please try again.\n".red
    book_choosing_by_genre
    end
 end

def highest_rating
    checkouts =  Checkout.all.select do |checkout|
    checkout.rate == 5
    end.first(5)
    puts "These are the 5 highest rated books at the moment.\n".light_blue
    checkouts.each_with_index do |checkout,index|
    puts "#{index+1}. #{checkout.book.title}" 
   end
   back_to_start
   run
   
end


def lowest_rating
    checkouts = Checkout.all.select do |checkout|
        checkout.rate == 1
    end.first(5)
    puts "These are the 5 lowest rated books at the moment.\n".light_blue
    checkouts.each_with_index do |checkout, index|
       puts "#{index+1}. #{checkout.book.title}"
    end
    back_to_start
    run
end

def is_availabile(author)
    is_available = author.checkouts.any? do |checkout|
            checkout.return_date == nil
          end
          if is_available 
            puts  "\nThe book is not available at the moment.\n".light_red
          else
            puts "\nThe book is available\n".cyan
          end
end

def is_availabile(title)
    is_available = title.checkouts.any? do |checkout|
    checkout.return_date == nil
      end
      if is_available 
        puts  "\nThe book is not available at the moment.\n".light_red

      else
        puts "\nThe book is available\n".cyan
      end
      
end
def top_authors
    puts "\nThese are the 5 most popular authors:\n".light_blue
    
    best_authors = Checkout.all.select do |best_author|
        best_author.rate == 1
    end.first(5)
     best_authors.map do |best|
        puts best.book.author
     end
    back_to_start_2
    title_menu_2(best_authors)
end

def title_menu_2(best_authors)
    command = gets.downcase.strip
    case command
    when "title"
      title_for_authors(best_authors)
    when 'main menu'
        help
      when 'exit'
        exit_app
      else
        option
    end
end
def title_for_authors(best_authors)
    puts "\nBook titles for top 5 authors:\n".blue
    best_authors.each do |checkout|
    puts checkout.book.title 
    end
    back_to_start
    run
end
        
def exit_app
    puts "\nThank you for using our app. Goodbye!".magenta
end

def run
    command = gets.downcase.strip
    case command
      when 'author'
        title_by_author
      when 'title'
        author_by_title
      when 'genre'
        chosen_boooksssss
      when 'highest rating'
        highest_rating
      when 'lowest rating'
        lowest_rating
      when 'top authors'
        top_authors
      when 'exit'
        exit_app
      else
        help
    end
end