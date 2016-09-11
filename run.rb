# Loads the class from the other file/ Runs code
require_relative "lib/lcbo_money"
require_relative "lib/product_inventory"

key = ENV['LCBO_API_KEY']

# If you don't pass a parameter to the new value, you don't need an initialize method
lcbo = LcboMoney.new(key)
p lcbo.monies

product_inventory = ProductInventory.new(key, '438457')
p product_inventory.quantity
