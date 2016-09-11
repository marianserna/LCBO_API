require 'http'
require_relative 'stores_page'

class LcboMoney
  attr_accessor :key

  def initialize(key)
    @key = key
  end

  def monies
    per_page = 100
    page = 1
    total_cents = 0
    more_records = true

    while (more_records) do
      url = "https://lcboapi.com/stores?access_key=#{key}&page=#{page}&per_page=#{per_page}"
      p "Getting page #{page}"

      data = HTTP.get(url).parse(:json)

      stores_page = StoresPage.new(data)
      total_cents += stores_page.total_inventory_cents

      if stores_page.any?
        more_records = true
        page += 1
      else
        more_records = false
      end
    end

    # (.0 allows returning decimals)
    total_cents/100.0
  end

end
