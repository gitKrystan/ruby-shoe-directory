require "bundler/setup"
require "pry"
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  @stores = Store.order(:name)
  @brands = Brand.order(:name)
  erb :index
end

get '/admin' do
  @stores = Store.order(:name)
  @brands = Brand.order(:name)
  erb :admin
end

post '/brands' do
  Brand.create(name: params[:brand_name])
  redirect '/admin'
end

post '/stores' do
  Store.create(name: params[:store_name])
  redirect '/admin'
end

get '/stores/:id' do
  id = params[:id]
  @store = Store.find(id)
  @store_brands = @store.brands.order(:name)
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

post '/stores/:id/brands' do
  id = params[:id]
  brand_id = params[:brand_id]
  store = Store.find(id)
  store.brands << Brand.find(brand_id)

  redirect "/stores/#{id}/edit"
end

get '/stores/:id/edit' do
  @store = Store.find(params[:id])
  @store_brands = @store.brands.order(:name)
  @add_brands = Brand.order(:name) - @store_brands
  erb :admin_store
end
