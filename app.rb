require 'bundler'
Bundler.require()

# **** Database Connection ****
ActiveRecord::Base.establish_connection(
  :adapter  => "postgresql",
  :database => "wdianimalsapi"
)


# **** Models ****
class Animal < ActiveRecord::Base
end

class Products < ActiveRecord::Base
end


# **** Routes ****
# **** Animals ***
get '/api/animals' do
  content_type :json
  animals = Animal.all
  animals.to_json
end

get '/api/animals/:id' do
  content_type :json
  animal = Animal.find(params[:id])
  animal.to_json
end

post '/api/animals' do
  content_type :json
  animal = Animal.create(params[:animal])
  animal.to_json
end

patch '/api/animals/:id' do
  content_type :json
  animal = Animal.find(params[:id])
  animal.update(params[:animal])
  animal.to_json
end

delete '/api/animals/:id' do
  content_type :json
  Animal.delete(params[:id])
  {message: 'success'}.to_json
end

get '/' do
  @animal = Animal.all.sample
  erb :index
end

get '/all-the-animals' do
  redirect '/api/animals', 302
end

# *** Products ***
get '/api/products' do
  content_type :json
  products = Product.all
  products.to_json
end

get '/api/products/:id' do
  content_type :json
  products = Product.find(params[:id])
  products.to_json
end

post '/api/products' do
  content_type :json
  products = Product.create(params[:product])
  products.to_json
end

patch '/api/products/:id' do
  content_type :json
  products = Product.find(params[:id])
  products.update(params[:product])
  products.to_json
end

delete '/api/products/:id' do
  content_type :json
  Product.delete(params[:id])
  {message: 'You have successfuly removed a product.'}.to_json
end

# *** Errors ***
not_found do
  content_type :json
  status 404
  {message: 'Not Found'}.to_json
end
