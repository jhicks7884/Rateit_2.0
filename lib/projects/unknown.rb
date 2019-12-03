class Projects::Unknown
  attr_accessor :name, :description, :url

    def self.today

        self.scrape_unknown

    end

    def self.scrape_unknown
        unknown = []

        unknown << self.scrape_sci_news
        unknown << self.scrape_projects
        unknown
    end

    def self.scrape_sci_news

        doc = Nokogiri::HTML(open('http://www.sci-news.com//'))

        unknown = self.new
        unknown.name = doc.search("#main > div > div.box.block1 > div > div.block > div > article > h3 > a").text.strip
        unknown.description = doc.search("#main > div > div.box.block1 > div > div.block > div > article > div > p").text.strip

       unknown
    end

    def self.scrape_projects
        #doc = Nokogiri::HTML(open('http://www.coindesk.com//'))
        unknown = self.new
        unknown.name = "Jeshua  Hicks" #doc.search("").text.strip
        unknown.description = "" #doc.search("").text.strip
        #binding.pry
        unknown
    end
end