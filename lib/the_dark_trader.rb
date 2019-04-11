require 'rubygems'
require 'rspec'
require 'pry'
require 'nokogiri'
require 'open-uri'

# Analyser HTML document
page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
row = page.css('div.table-responsive.compact-name-column table#currencies-all tr')

#soler les éléments HTML que l'on veut
row.each do |row|
  symbol = row.css('td.text-left.col-symbol')
  price = row.css('td.no-wrap.text-right a.price')

# Créer un array des cryptos
  crypto = []
  symbol.each do |symbol|
   crypto << symbol.text
  end

# Créer un array des prix
  value = []
  price.each do |price|
    value << price.text.delete_prefix("$").to_f.round(2)
  end

# Réunir les crytpos avec leur prix dans un hash
  hash = Hash[crypto.zip(value)]

# Créer un array de hash avec les valeurs
  a = []
  hash.each do
    a << hash
  end

# Afficher l'array de hash
  puts a

end
