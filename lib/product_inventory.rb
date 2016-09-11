require 'http'


# p quantity

class ProductInventory
  attr_accessor :key, :product

  def initialize(key, product)
    @key = key
    @product = product
  end

  def quantity
    page_number = 1
    keep_going = true
    total = 0

    while (keep_going) do
      # STEP 1
      url = "https://lcboapi.com/inventories?product_id=#{product}&access_key=#{key}&page=#{page_number}"

      # p "Getting page #{page_number}"
      data = HTTP.get(url).parse(:json)

      data['result'].each do |store_inventory|
        total += store_inventory['quantity']
      end

      if data['result'].length > 0
        keep_going = true
        page_number += 1
      else
        keep_going = false
      end
    end
    total
  end
end
