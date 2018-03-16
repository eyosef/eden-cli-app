require 'nokogiri'
require 'HTTParty'
require 'pry'



class Articles #CLIApp::Articles

  attr_accessor :name, :date, :author, :url, :website, :articles

  @@articles = []

  def initialize(name, url)
    @name = name
    @url = url
  end

  def self.articles
    @website = HTTParty.get("https://technical.ly/dc/")
    @technically = Nokogiri::HTML(website)

    self.newest_posts
    self.latest_posts

    @@articles = @@articles.uniq

  end #today method

  def self.newest_posts
    @technically.css(".network-posts").children.each do |article|
        unless article.blank?
          url = article.attribute("href").value
          name = article.attribute("title").value.gsub("Read more about ", "")
          @@articles << self.new(name, url)
        end #unless loop
    end #each iteration
  end

  def self.latest_posts
    @technically.css(".latest-post-link").each do |article| #technically.css(".latest-posts-container a") #technically.css(".latest-posts a")
      unless article.blank?
        url = article.attribute("href").value
        name = article.attribute("title").value.gsub("Read more about ", "").gsub("\u2019", "'")
        @@articles << self.new(name, url)
      end #unless loop
    end #each iteration
  end



end #class
