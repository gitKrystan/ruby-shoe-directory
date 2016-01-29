require "bundler/setup"
require "pry"
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  erb :index
end

get '/admin' do
  @stores = Store.order(:name)
  erb :admin
end

post '/stores' do
  Store.create(name: params[:store_name])

  redirect '/admin'
end

get '/stores/:id' do
  erb :store
end

get '/stores/:id/edit' do
  erb :admin_store
end
