#our CLI controller - responsible for business logic/user interactions
require 'pry'
require_relative 'articles'

class Initialize #CLIApp::CLI

  @@basket = []

  @@articles = Articles.today

  def call
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
    print @@basket.uniq
  end

  def welcome
    puts "-------------------------------------------------"
    puts "| ********************************************** |"
    puts "| ********************************************** |"
    puts "| ********************************************** |"
    puts "| *********WELCOME TO TECHNICAL.lY DC!!!!******* |"
    puts "| ********************************************** |"
    puts "| ********************************************** |"
    puts "| ********************************************** |"
    puts "-------------------------------------------------"

    welcome_message
  end

  def welcome_message
    puts "Are you ready to get your read ON?"
    puts "Carpe librum!"

    puts "Please type LIST to receive the complete list of articles."
    puts "From there, you will be able to select an article."
    puts "If you would like to exit, type LIST. When the list loads, type EXIT."

    input = nil
    while input != "LIST"
      input = gets.chomp
      if input != "LIST"
        puts "Uh-oh, I can't compute."
        puts "Please type LIST to receive the complete list of articles."
        puts "From there, you will be able to select an article."
        puts  "If you would like to exit, type LIST. When the list loads, type EXIT."
      end
    end #while loop
    library
  end

  def list_articles
    puts "Check out these articles:"
    @@articles = Articles.today #CLIApp::Articles.today
    @@articles.each.with_index(1) do |array, i|
        puts "#{i}."
      array.each.with_index do |article, i|
        puts "Title: #{article.name}"
        puts "URL: #{article.url}"

      end #each iteration
    end #each iteration
  end


  def selection
    input = nil
    while input != "EXIT"
      puts "Please enter the number of the article you would like to read,"
      puts "type LIST to receive the complete list of articles,"
      puts "type BASKET to receive the list of articles you selected,"
      puts "or type EXIT to leave."
      input = gets.chomp
        if input == "LIST"
          list_articles
        elsif input == "BASKET"
          basket
        elsif input.to_i - 1 < 0 && input != "EXIT"
          puts "I'm not sure what you mean by that."
        elsif input.to_i - 1 >= @@articles.length && input != "EXIT"
          puts "I'm not sure what you mean by that."
        else input.to_i > 0 && input.to_i - 1 <= @@articles.length && input != "EXIT"
            the_article = @@articles[input.to_i - 1]
            the_article.each.with_index(1) do |article, i|
                puts "Article: #{article.name}."
                puts "URL: #{article.url}"

                @@basket << "Article: #{article.name}, URL: #{article.url}"

            end #each with index
        end #if statement
    end #while loop
    goodbye
  end #selection method



end
