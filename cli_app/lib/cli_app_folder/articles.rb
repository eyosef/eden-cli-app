class CLIApp::Articles

  attr_accessor :name, :date, :author, :url



  def self.today
    #return instances of articles
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
end
