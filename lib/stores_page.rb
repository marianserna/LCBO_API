# This does it for one page. All the calculations are done here. We can test this without calling the API, we can control the things we're testing

class StoresPage
  attr_accessor :data

  def initialize(data)
    @data = data
  end

  def total_inventory_cents
    total_cents = 0

    data['result'].each do |store|
      total_cents += store['inventory_price_in_cents']
    end

    total_cents
  end

  def any?
    data['result'].any?
  end
end
