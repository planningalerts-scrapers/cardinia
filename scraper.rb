require 'scraperwiki'
require 'mechanize'

agent = Mechanize.new

def scrape_page(page)
  table = page.at("table")

  table.search("tr")[1..-1].each do |tr|
    day, month, year = tr.search("td")[3].inner_text.gsub(/[[:space:]]/, ' ').split(" ")
    month_i = Date::MONTHNAMES.index(month)

    link = tr.search("td a")[0]
    if link.nil?
      puts "Skipping what is probably a blank line in the table"
      next
    end

    record = {
      "info_url" => link.attributes['href'].to_s,
      "council_reference" => tr.search("td")[0].inner_text.strip,
      "description" => tr.search("td")[1].inner_text.strip,
      "address" => tr.search("td")[2].inner_text.strip + ", VIC",
      "on_notice_to" => (Date.new(year.to_i, month_i, day.to_i).to_s if day && month && year),
      "date_scraped" => Date.today.to_s
    }

    puts "Saving record " + record['council_reference'] + ", " + record['address']
#      puts record
    ScraperWiki.save_sqlite(['council_reference'], record)
  end
end

url = "https://www.cardinia.vic.gov.au/advertisedplanningapplications"
page = agent.get(url)
puts "Scraping page..."
scrape_page(page)
