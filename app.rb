require 'rubygems'
require 'sinatra'
require 'slim'
require 'active_record'
require './models'

set :bind, '0.0.0.0'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'sinatra.sqlite3.db'
)

get "/" do
  @users = User.all
  slim :index
end

get '/page' do 
  slim :page
end
