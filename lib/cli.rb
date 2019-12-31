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
  - availability : check to see if this book is available
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
# we need index for ratings




def title_by_author
   all_authors
   puts "Please type the number of the author to see the title:"
    user_input = gets.chomp
    if (user_input.to_i) <= Book.all.count
      chosen_author = Book.all[user_input.to_i - 1]
      puts chosen_author.title
      puts "**** by **** "
      puts chosen_author.author
    else
      puts "Invalid input, please try again."
    end
    option
    main_menu
    
end
def author_by_title
    all_titles
    puts "Please type the number of the title to see the author:"
     user_input = gets.chomp
     if (user_input.to_i) <= Book.all.count
       chosen_author = Book.all[user_input.to_i - 1]
       puts chosen_author.title
       puts "**** by **** "
       puts chosen_author.author
   
     else
       puts "Invalid input, please try again."
     end
      option
      availability
      main_menu
 
end
def main_menu
    command = gets.downcase.strip
    case command
    when 'main menu'
      help
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
    checkouts.each do |checkout|
       puts checkout.book.title
    end
     option
     main_menu
end
def lowest_rating
      checkouts = Checkout.all.select do |checkout|
        checkout.rate == 1
    end.first(5)
    checkouts.each do |checkout|
       puts checkout.book.title
    end
     option
     main_menu
end

def availability
 
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