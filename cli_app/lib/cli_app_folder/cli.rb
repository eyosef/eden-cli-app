#our CLI controller - responsible for business logic/user interactions
require 'pry'
require_relative 'articles'

class Initialize #CLIApp::CLI

  def call
    @articles = Articles.articles
    @basket = []
    welcome
  end

  def library
    list_articles
    selection
  end

  def goodbye
    puts "Have a great day, and feel free to circle back!"
  end

  def basket
    print @basket.uniq
  end

  def welcome
    puts "-------------------------------------------------"
    puts "| ********************************************** |"
    puts "| ********************************************** |"
    puts "| ********************************************** |"
    puts "| *********WELCOME TO TECHNICAL.LY!!!!********** |"
    puts "| ********************************************** |"
    puts "| ********************************************** |"
    puts "| ********************************************** |"
    puts "-------------------------------------------------"

    puts "Are you ready to get your read ON?"
    puts "Carpe librum!"

    welcome_message
  end

  def welcome_message

    puts "Please type ARTICLES to receive the complete list of articles."
    puts "From there, you will be able to select an article."
    puts "If you would like to exit, type ARTICLES. When the list loads, type EXIT."

      input = gets.chomp
      if input != "EXIT" && input != "ARTICLES"
        puts "Uh-oh, I can't compute."
        welcome_message
      elsif input == "ARTICLES"
        library
      end
      goodbye
  end

  def list_articles
    puts "Check out these articles:"
    @articles.each.with_index(1) do |article, i|
        puts "#{i}."
        puts "Title: #{article.name}"
        puts "URL: #{article.url}"
    end #each iteration
  end


  def selection
    input = nil
    while input != "EXIT"
      puts "Please enter the number of the article you would like to read,"
      puts "type ARTICLES to receive the complete list of articles,"
      puts "type BASKET to receive the list of articles you selected,"
      puts "or type EXIT to leave."
      input = gets.chomp
        if input == "ARTICLES"
          list_articles
        elsif input == "BASKET"
          basket
        elsif input.to_i - 1 < 0 && input != "EXIT"
          puts "I'm not sure what you mean by that."
        elsif input.to_i - 1 >= @articles.length && input != "EXIT"
          puts "I'm not sure what you mean by that."
        elsif input.to_i > 0 && input.to_i - 1 <= @articles.length && input != "EXIT"
            the_article = @articles[input.to_i - 1]
                puts "Article: #{the_article.name}."
                puts "URL: #{the_article.url}"

                @basket << "Article: #{the_article.name}, URL: #{the_article.url}"

        end #if statement
    end #while loop
  end #selection method



end
