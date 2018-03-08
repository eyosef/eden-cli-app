#our CLI controller - responsible for business logic/user interactions
require 'pry'
require_relative 'articles'

class Initialize #CLIApp::CLI

  @@basket = []

  @@articles = Articles.today

  def call
    list_articles
    selection
  end

  def goodbye
    puts "Have a great day, and feel free to circle back!"
  end

  def basket
    print @@basket.uniq
  end

  def list_articles
    puts "-------------------------------------------------"
    puts "|"                                              "|"
    puts "|"                                              "|"
    puts "|"                                              "|"
    puts "|"      "Welcome to Technical.ly DC!!!!"        "|"
    puts "|"                                              "|"
    puts "|"                                              "|"
    puts "|"                                              "|"
    puts "-------------------------------------------------"
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
    while input != "exit"
      puts "Please enter the number of the article you would like to read,"
      puts "type list to receive the complete list of articles,"
      puts "type basket to receive the list of articles you selected,"
      puts "or type exit to leave."
      input = gets.strip
        if input == "list"
          list_articles
        elsif input == "exit"
          goodbye
        elsif input == "basket"
          basket
        elsif input.to_i - 1 < 0
          puts "I'm not sure what you mean by that."
        elsif input.to_i - 1 >= @@articles.length
          puts "I'm not sure what you mean by that."
        else input.to_i > 0 && input.to_i - 1 <= @@articles.length
            the_article = @@articles[input.to_i - 1]
            the_article.each.with_index(1) do |article, i|
                puts "Article: #{article.name}."
                puts "URL: #{article.url}"

                @@basket << "Article: #{article.name}, URL: #{article.url}"

            end #each with index
        end #if statement
    end #while loop
  end #selection method



end
