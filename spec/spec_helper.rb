ENV['RACK_ENV'] = 'test'

require "bundler/setup"
Bundler.require :default, :test
set :root, Dir.pwd

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

require "capybara/rspec"
Capybara.app = Sinatra::Application
set :show_exceptions, false
require "./app"

RSpec.configure do |config|
  config.after :each do
    Brand.all.each do |brand|
      brand.destroy
    end
  end
end

def create_test_store(brand = nil)
  if brand
    brand.stores.create(name: 'test store')
  else
    Store.create(name: 'test store')
  end
end

def create_test_brand(store = nil)
  if store
    store.brands.create(name: 'test brand')
  else
    Brand.create(name: 'test brand')
  end
end
