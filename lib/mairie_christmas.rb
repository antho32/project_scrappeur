require 'nokogiri'
require 'open-uri'

def get_townhall_urls
    page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))

    names = []

    page.xpath('//tr[1]//p/a/@href').each do |node|
        names.push(node.text)
    end
    result_url = names.map do |x|
        x[1..-1]
    end
end
puts get_townhall_urls
    
    def get_townhall_email
    n = get_townhall_urls.count
    i = 0
    emails = []
    while i < n
        doc = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com#{get_townhall_urls[i].to_s}"))
        result = doc.xpath('//section[2]/div/table/tbody/tr[4]/td[2]').map do |node|
            emails.push(node.text)
        end
        p emails[i]
        i += 1
    end
end
puts get_townhall_email