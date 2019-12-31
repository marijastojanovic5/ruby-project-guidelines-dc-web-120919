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
  - main menu : go back to main menu
  - exit : exit the app

  OPTIONS
   puts options
  
end
# we need one menu for author and title and another one when ppl pick ratings.
# author and title: be able to select another book
# for rating just availability
# uniq method for ratings
# we need availability method 

def title_by_author
   all_authors
   puts "Please type the number of the author to see the title:"
   book_choosing_by_author
   option
   main_menu
   availability
    
end
def book_choosing_by_author
    user_input = gets.chomp
    if (user_input.to_i) <= Book.all.count
      chosen_author = Book.all[user_input.to_i - 1]
      puts chosen_author.title
      puts "**** by **** "
      puts chosen_author.author
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
    else
    all_titles
    puts "Invalid input, please try again."
    book_choosing_by_title
    end


end
def author_by_title
    all_titles
    puts "Please type the number of the title to see the author:"
    book_choosing_by_title
    option
    main_menu
    availability
 
end
def main_menu
    command = gets.downcase.strip
    case command
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
    availability 
    option
    main_menu
end
def lowest_rating
      checkouts = Checkout.all.select do |checkout|
        checkout.rate == 1
    end.first(5)
    checkouts.each_with_index do |checkout, index|
       puts "#{index+1}. #{checkout.book.title}"
    end
    puts "Choose the book for availability:"
     availability
     option
     main_menu
end

def availability
     user_input = gets.chomp
     if (user_input.to_i) <= Book.all.count
       chosen_book = Book.all[user_input.to_i - 1]
       # else
    #   puts "Invalid input, please try again."
      
    # end
   
    # Checkout.all.select do |checkout|
    #     # binding.pry
    # if checkout.return_date != nil
   
    puts "The book is available"
     else
     puts "The book is not available at the moment."
#     end
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