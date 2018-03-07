require 'nokogiri'
require 'HTTParty'
require 'pry'



class Articles #CLIApp::Articles

  attr_accessor :name, :date, :author, :url, :website

  def initialize
    @name = name
    @date = date
    @author = author
    @url = url
    @website = website
  end


  def self.testing
    puts "We're inside of this method. Woo-hoo!"
    website = HTTParty.get("https://technical.ly/dc/")
    technically = Nokogiri::HTML(website)
    technically.css(".network-post-link")

    article = {}

    #technically.css(".network-posts").children.each do |article|
    technically.css(".network-posts-link").children.each do |article|
          binding.pry
          if article.include?("href")
            url = article.attribute("href").value
          else article.include?("title")
           title = article.attribute("title").value
          end
    end
  end


  # def self.today
  #   #scrape Technicaly
  #   #return articles based on that data
  #   self.scrape_articles
  #
  # end
  #
  # def self.scrape_tech
  #
  #   website = File.read('https://technical.ly/')
  #   technically = Nokogiri::HTML(website)
  #
  # end


  def self.today

    #go to technicaly, find Articles
    #extract Articles
    #instantiate articles

    article1 = self.new
    article1.name = "Will this Brooklyn startup allow everyone to make professional-quality content?"
    article1.date = "March 5, 2018"
    article1.author = "Tyler Woods"
    article1.url = "https://technical.ly/brooklyn/2018/03/05/kitsplit-funding-gear-rental-high-quality-content/"

    article2 = self.new
    article2.name = "Up Top Acres is planning to grow rooftop farming in the DMV"
    article2.date = "March 5, 2018"
    article2.author = "Stephen Babcock"
    article2.url = "https://technical.ly/dc/2018/03/05/top-acres-planning-grow-rooftop-farming-dmv/"

    article3 = self.new
    article3.name = "Free Code Camp Philly: A career changer's way to give back"
    article3.date = "March 5, 2018"
    article3.author = "Roberto Torres"
    article3.url = "https://technical.ly/philly/2018/03/05/free-coding-camp-philly-study-hall/"

    [article1, article2, article3]
  end

end #class

Articles.testing
