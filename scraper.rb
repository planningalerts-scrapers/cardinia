require 'scraperwiki'
require 'mechanize'

agent = Mechanize.new

def scrape_page(page, url)
  table = page.at("table")
  
  table.search("tr")[1..-1].each do |tr|
    day, month, year = tr.search("td")[3].inner_text.split(" ")
    month_i = Date::MONTHNAMES.index(month)
    
    record = {
      "info_url" => url,
      "comment_url" => url,
      "council_reference" => tr.search("td")[0].inner_text,
      "description" => tr.search("td")[1].inner_text,
      "address" => tr.search("td")[2].inner_text + ", VIC",
      "on_notice_to" => Date.new(year.to_i, month_i, day.to_i).to_s,
      "date_scraped" => Date.today.to_s
    }
    
    # Check if record already exists
    if (ScraperWiki.select("* from data where `council_reference`='#{record['council_reference']}'").empty? rescue true)
      ScraperWiki.save_sqlite(['council_reference'], record)
    else
      puts "Skipping already saved record " + record['council_reference']
    end
  end
end

url = "http://www.cardinia.vic.gov.au/Page/Page.aspx?Page_Id=4421"
page = agent.get(url)
puts "Scraping page..."
scrape_page(page, url)
