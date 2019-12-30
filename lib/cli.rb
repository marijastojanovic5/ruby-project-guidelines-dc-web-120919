def welcome
    puts "
           Welcome to our Library
    __...--~~~~~-._   _.-~~~~~--...__
    //               `V'               \\ 
   //    Marija       |     Dean        \\ 
  //__...--~~~~~~-._  |  _.-~~~~~~--...__\\ 
 //__.....----~~~~._\ | /_.~~~~----.....__\\
====================\\|//====================
                    `---`
 "
 help
   
end
def help
     help = <<-HELP
     Please choose one of the following:
      Book by
      -author : displays all the books by authors
      -title : displays all the books by title
      -highest rating : displays book with max rating
      -lowest rating : displays book with min rating
      -exit : exits the app
    HELP
  puts help
  run
end
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
    # options
    # recipe_detail_menu(chosen_recipe)
end

    

def all_authors
    Book.all.each_with_index {|book, index|
    puts "#{index+1}. #{book.author}"}
end

def exit_app
    puts "Thank you for using our app. Goodbye!"
end
def run
    command = gets.downcase.strip
    #   puts "Please enter a command:"
    case command
      when 'author'
        title_by_author
      when 'title'
        # ingredient_submenu
      when 'highest rating'
      when 'lowest rating'
      when 'exit'
        exit_app
      else
        help
      end
  end