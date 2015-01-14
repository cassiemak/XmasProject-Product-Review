namespace :scrape do
  desc "Scrape BTBs"
  task :scrape_babyproducts => :environment do
  
    require 'open-uri'
    require 'nokogiri'

    (0..1000).each do |data_id|
      input_data(data_id)
      puts data_id
    # loop
    end
  #:scrape_babyproducts
  end

  def input_data(data_id)
    url = "http://www.bumpstobabes.com/index.php/ProductDetail.html?id=#{data_id}"
    document = open(url).read

    html_doc = Nokogiri::HTML(document)

    dataStructure_details = "body > div > div > div:nth-child(3) > p:nth-child(3).contentText"
    dataStructure_pix = "body > div > div > div > img"
    dataStructure_name = "body > div > div > p.headerText"
    dataStructure_brand = "body > div > div > p > i"
    dataStructure_price = "body > div > div > div > p:nth-child(1).headerText"


    details = html_doc.css(dataStructure_details)
    puts details

    if not details.any?
      return
    end

    details_pix = html_doc.css(dataStructure_pix)[0]['src']
    puts details_pix

    details_name = html_doc.css(dataStructure_name)[0].text
    puts details_name

    details_brand = html_doc.css(dataStructure_brand)[0].text
    puts details_brand

    details_price = html_doc.css(dataStructure_price)[0].text
    details_price = details_price.gsub('HK$','').gsub(',','')
    puts details_price

    new_product = Product.new
    new_product.product_name = details_name
    new_product.img_url = "http://www.bumpstobabes.com/#{details_pix}"
    new_product.description = details[0].text
    new_product.found_at = "bumps to babes" 
    new_product.price = details_price
    new_product.brand = details_brand
    new_product.save 

  #function input_data
  end
end