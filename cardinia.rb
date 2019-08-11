#require 'scraperwiki'
require 'mechanize'

agent = Mechanize.new

def scrape_page(page, comment_url)
  table = page.at("table")

  table.search("tr")[1..-1].each do |tr|

    on_notice_raw = tr.search("td")[3].inner_text.gsub(/[[:space:]]/, ' ').split(" ")

    if on_notice_raw.include? "N/A"
        on_notice_date = "Nil"
    else
        day, month, year = on_notice_raw
        month_i = Date::MONTHNAMES.index(month)
        on_notice_date = Date.new(year.to_i, month_i, day.to_i).to_s
    end

    address = tr.search("td")[2].inner_text + ", VIC"

    record = {
      "info_url" => tr.search("td a")[0].attributes['href'].to_s,
      "comment_url" => comment_url,
      "council_reference" => tr.search("td")[0].inner_text,
      "description" => tr.search("td")[1].inner_text,
      "address" => address,
      "on_notice_to" => on_notice_date,
      "date_scraped" => Date.today.to_s
    }

    puts "Saving record " + record['council_reference'] + ", " + record['address'] + ", " + record['on_notice_to'] + ", " + record['description']
    #puts "Saving record " + record['council_reference'] + ", " + record['address']
#      puts record
    #ScraperWiki.save_sqlite(['council_reference'], record)
  end
end

url = "https://www.cardinia.vic.gov.au/advertisedplanningapplications"
comment_url = "mailto:mail@cardinia.vic.gov.au"
page = agent.get(url)
puts "Scraping page..."
scrape_page(page, comment_url)