require_relative '../../lib/stores_page'

RSpec.describe StoresPage do

  describe '.any' do
    it 'returns true when result' do
      data = {
        'result' => [
          {
            'inventory_price_in_cents' => 1361550
          }
        ]
      }
      #instantiate the stores_page class
      stores_page = StoresPage.new(data)

      expect(stores_page.any?).to eq(true)
    end

    it 'returns false when no result' do
      data = {
        'result' => []
      }

      stores_page = StoresPage.new(data)

      expect(stores_page.any?).to eq(false)
    end
  end

  describe '.total_inventory_cents' do
    it 'returns total inventory cents for all stores on page' do
      data = {
        'result' => [
          {
            'inventory_price_in_cents' => 500
          },
          {
            'inventory_price_in_cents' => 350
          }
        ]
      }

      stores_page = StoresPage.new(data)

      expect(stores_page.total_inventory_cents).to eq(850)
    end
  end

end
