require('bundler/setup')
require "pry"
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  erb(:index)
end

get '/admin' do
  erb(:admin)
end

get '/stores/:id' do
  erb(:store)
end

get '/stores/:id/edit' do
  erb(:admin_store)
end
