require 'nokogiri'
require 'open-uri'

class ScrapeBbcGoodFoodService

  def call
    url = 'https://tokyo.craigslist.org/d/antiques/search/ata?lang=en&cc=us'
    html = open(url).read

    doc = Nokogiri::HTML(html)

    # p doc.text
    names_array
    doc.search('.result-info').map do |card|
      name = card.search('.result-title').text.strip
      description = card.search('.result-price').text.strip
      # recipe = { name: name, description: description }
      Recipe.new(name, description)
    end
  end
end

'https://www.airbnb.com/s/Barcelona--Spain/rooms'

# => rooms controller # list
# hey repository, give me all of the homes
# homes = repository.all
# @view.display(homes)

'https://www.airbnb.com/rooms/32494777'

# rooms controller but give me the room with id 3249477
# home = repository.find(id)
# @view.display(home)

'https://www.airbnb.com/users'
# => users controller # list
# users = repository.all
# @view.display(users)
