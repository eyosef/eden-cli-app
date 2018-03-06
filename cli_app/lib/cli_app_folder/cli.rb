#our CLI controller - responsible for business logic/user interactions
class CLIApp::CLI

  def call
    puts "Today's articles:"
    list_articles
    selection
    goodbye
  end

  def list_articles
    #should call on an articles method that scrapes/puts this data
    puts <<-DOC
    1. Will this Brooklyn startup allow everyone to make professional-quality content?
        - Published on DATE
        - Published by PERSON
    2. Up Top Acres is planning to grow rooftop farming in the DMV
        - Published on DATE
        - Published by PERSON
    3. Free Code Camp Philly: A career changer's way to give back
        - Published on DATE
        - Published by PERSON
    DOC
    @articles = CLIApp::Articles.today
  end

  def selection

    input = nil
    while input != "exit"
      puts "Please enter the number of the article you would like to read,"
      puts "type list to receive the complete list of articles,"
      puts "or type exit to leave."
      input = gets.strip
      case input
        when "1"
          puts "Thank you for selecting article #1. Your article is coming up... "
        when "2"
          puts "Thank you for selecting article #2. Your article is coming up... "
        when "3"
          puts "Thank you for selecting article #3. Your article is coming up... "
        when "list"
          list_articles
        else
          puts "I'm not sure what you mean by that."
      end #case
    end #while loop
  end #selection method

  def goodbye
    puts "Have a great day, and feel free to circle back!"
  end

end
