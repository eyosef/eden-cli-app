require 'nokogiri'
require 'HTTParty'
require 'pry'



class Initialize::Articles #CLIApp::Articles

  attr_accessor :name, :date, :author, :url, :website, :articles

  @@articles = []

  def initialize(name, url)
    @name = name
    @url = url
  end


  def self.testing
    website = HTTParty.get("https://technical.ly/dc/")
    technically = Nokogiri::HTML(website)
    technically.css(".network-post-link")

    technically.css(".network-posts").children.each do |article|
        unless article.blank?
          url = article.attribute("href").value
          name = article.attribute("title").value.gsub("Read more about ", "")
          @@articles << [self.new(name, url)]
          @@articles
        end #unless loop
        @@articles
    end #each iteration

    technically.css(".latest-post-link").each do |article| #technically.css(".latest-posts-container a") #technically.css(".latest-posts a")
      unless article.blank?
        url = article.attribute("href").value
        name = article.attribute("title").value.gsub("Read more about ", "").gsub("\u2019", "'")
        @@articles << [self.new(name, url)]
        @@articles
      end #unless loop
    end #each iteration
      @@articles
  end #testing method


  # def self.today
  #   #scrape Technicaly
  #   #return articles based on that data
  #   self.scrape_articles
  #
  # end
  #
  def self.today

    #go to technicaly, find Articles
    #extract Articles
    #instantiate articles

    # article1 = self.new
    # article1.name = "Will this Brooklyn startup allow everyone to make professional-quality content?"
    # article1.date = "March 5, 2018"
    # article1.author = "Tyler Woods"
    # article1.url = "https://technical.ly/brooklyn/2018/03/05/kitsplit-funding-gear-rental-high-quality-content/"
    #
    # article2 = self.new
    # article2.name = "Up Top Acres is planning to grow rooftop farming in the DMV"
    # article2.date = "March 5, 2018"
    # article2.author = "Stephen Babcock"
    # article2.url = "https://technical.ly/dc/2018/03/05/top-acres-planning-grow-rooftop-farming-dmv/"
    #
    # article3 = self.new
    # article3.name = "Free Code Camp Philly: A career changer's way to give back"
    # article3.date = "March 5, 2018"
    # article3.author = "Roberto Torres"
    # article3.url = "https://technical.ly/philly/2018/03/05/free-coding-camp-philly-study-hall/"

    website = HTTParty.get("https://technical.ly/dc/")
    technically = Nokogiri::HTML(website)
    technically.css(".network-post-link")

    technically.css(".network-posts").children.each do |article|
        unless article.blank?
          url = article.attribute("href").value
          name = article.attribute("title").value.gsub("Read more about ", "")
          @@articles << [self.new(name, url)]
          @@articles
        end #unless loop
        @@articles
    end #each iteration

    technically.css(".latest-post-link").each do |article| #technically.css(".latest-posts-container a") #technically.css(".latest-posts a")
      unless article.blank?
        url = article.attribute("href").value
        name = article.attribute("title").value.gsub("Read more about ", "").gsub("\u2019", "'")
        @@articles << [self.new(name, url)]
        @@articles
      end #unless loop
    end #each iteration
    @@articles

  end #today method




end #class
