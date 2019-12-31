require 'pry'
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
 "
 help
   
end
def help
     help = <<-HELP
     Please choose one of the following:
      Book by
      -author : displays all the books by authors
      -title  : displays all the books by title
      -highest rating : displays book with max rating
      -lowest rating  : displays book with min rating
      -exit : exits the app
    HELP
  puts help
  run
end

def option
    options = <<-OPTIONS
  
  Please type one of the following:
  - ? : check book availability
  - main menu : go back to main menu
  - exit : exit the app

  OPTIONS
   puts options
  
end
# uniq method for ratings
# we need availability method for rating 

def title_by_author
   all_authors
   puts "Please type the number of the author to see the title:"
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
   puts start
  

    
end
def book_choosing_by_author
    user_input = gets.chomp
    if (user_input.to_i) <= Book.all.count
      chosen_author = Book.all[user_input.to_i - 1]
      puts chosen_author.author
      puts "**** wrote **** "
      puts chosen_author.title
      return chosen_author
    else
    all_authors
    puts "Invalid input, please try again."
    book_choosing_by_author
    end


end
def book_choosing_by_title
    user_input = gets.chomp
    
    if (user_input.to_i) <= Book.all.count
      chosen_author = Book.all[user_input.to_i - 1]
      puts chosen_author.title
      puts "**** by **** "
      puts chosen_author.author
      return chosen_author
    else
    all_titles
    puts "Invalid input, please try again."
    book_choosing_by_title
    end


end
def author_by_title
    all_titles
    puts "Please type the number of the title to see the author:"
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

def highest_rating
    checkouts =  Checkout.all.select do |checkout|
    checkout.rate == 5
    end.first(5)
    checkouts.each_with_index do |checkout,index|
    puts "#{index+1}. #{checkout.book.title}" 
   end
puts "Choose the book for availability:"
    # availability 
    option
    # main_menu
end
def lowest_rating
      checkouts = Checkout.all.select do |checkout|
        checkout.rate == 1
    end.first(5)
    checkouts.each_with_index do |checkout, index|
       puts "#{index+1}. #{checkout.book.title}"
    end
    puts "Choose the book for availability:"
    #  availability_for_lowest
     option
    #  main_menu
end

def is_availabile(author)
    # Note: Need to test
        is_available = author.checkouts.any? do |checkout|
            
                  checkout.return_date == nil
          end
          if is_available 
            puts  "The book is not available at the moment."

          else
            puts "The book is available"
            
          end
end
   def is_availabile(title)
   # Note: Need to test
    is_available = title.checkouts.any? do |checkout|
    checkout.return_date == nil
      end
      if is_available 
        puts  "The book is not available at the moment."

      else
        puts "The book is available"

      end
      
   end
        


def exit_app
    puts "Thank you for using our app. Goodbye!"
end
def run
    command = gets.downcase.strip
    case command
      when 'author'
        title_by_author
      when 'title'
        author_by_title
      when 'highest rating'
        highest_rating
      when 'lowest rating'
        lowest_rating
      when 'exit'
        exit_app
      else
        help
    end
end