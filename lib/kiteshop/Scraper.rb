class Scraper 
 # url = 'https://www.realwatersports.com/collections/kites/'

  #index_url='https://www.realwatersports.com/collections/kites#/size_9m'
  def self.scrape_page(index_url)
    page = Nokogiri::HTML(open(index_url))
    #students = []
    (".productgrid--item-kite .productitem--title a").text.strip
    page.css("div.roster-cards-container").each do |card|
      card.css(".student-card a").each do |student|
        student_profile_link = "#{student.attr('href')}"
        student_location = student.css('.student-location').text
        student_name = student.css('.student-name').text
        students << {name: student_name, location: student_location, profile_url: student_profile_link}
      end
    end
    students
  end
  


#index_page = Nokogiri::HTML(open(index_url))

index_page.css(".productgrid--item-kite .productitem--title a").text.strip
arr = index_page.css(".productgrid--item-kite .productitem--title a").text.split("\n        \n")

products = arr.collect {|string| string.strip}

##site = 'https://www.realwatersports.com/collections/kites/products/2019-slingshot-rpm-kite'

#page = Nokogiri::HTML(open(index_url))

#page.css("h5 ul li")
end