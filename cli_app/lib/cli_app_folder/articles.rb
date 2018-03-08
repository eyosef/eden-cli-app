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
    website = HTTParty.get("https://technical.ly/dc/")
    technically = Nokogiri::HTML(website)
    technically.css(".network-post-link")

    technically.css(".network-posts").children.each do |article|
        unless article.blank?
          url = article.attribute("href").value
          name = article.attribute("title").value.gsub("Read more about ", "")
          @@articles << self.new(name, url)
        end #unless loop
    end #each iteration


    technically.css(".latest-post-link").each do |article| #technically.css(".latest-posts-container a") #technically.css(".latest-posts a")
      unless article.blank?
        url = article.attribute("href").value
        name = article.attribute("title").value.gsub("Read more about ", "").gsub("\u2019", "'")
        @@articles << self.new(name, url)
      end #unless loop
    end #each iteration

    @@articles = @@articles.uniq

  end #today method



end #class

class Events

  attr_accessor :event_name, :address, :date, :description

  @@events = []

  def initialize (event_name, date, address, description)
    @event_name = event_name
    @date = date
    @address = address
    @description = description
  end


  def self.events
    events_website = HTTParty.get("https://technical.ly/events/")
    events = Nokogiri::HTML(events_website)
    events.css(".job-listing").each do |listing|

      event_name = listing.children.first.text
      address = listing.children[2].text
      date = listing.children[3].text
      binding.pry
      description =  listing.children[4].text
      @@events << self.new(event_name, date, address, description)
    end #each iteration
    @@events.uniq
    binding.pry
  end #events method

end #class events


#listing.children.first

Events.events
