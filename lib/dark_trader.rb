require 'nokogiri'
require 'open-uri'

def crypto_scrapper
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
  
  names = []
  page.xpath('//tr/td[3]').each do |node| 
      names.push(node.text)
  end

  prices = []
  page.xpath('//tr/td[5]').each do |node|
      prices.push(node.text)
  end

  result_scrap = names.map.with_index do |name, index|
      new_hash = {}
      new_hash[name] = prices [index]
      new_hash
  end

end
puts crypto_scrapper