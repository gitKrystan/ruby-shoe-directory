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

patch '/stores/:id' do
  id = params[:id]
  name = params[:store_name]
  store = Store.find(id)
  store.update(name: name)

  redirect "/stores/#{id}/edit"
end

delete '/stores/:id' do
  id = params[:id]
  store = Store.find(id)
  store.destroy

  redirect "/admin"
end

get '/stores/:id/edit' do
  @store = Store.find(params[:id])
  @brands = @store.brands.order(:name)
  erb :admin_store
end
