require 'rubygems'
require 'sinatra'
require 'slim'
require 'active_record'
require 'sprockets'
require './User'

# set :bind, '0.0.0.0'

environment = Sprockets::Environment.new

set :environment, environment

environment.append_path "assets/stylesheets"
environment.append_path "assets/javascripts"

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'rails_dev',
  :username => 'postgres'
)

get "/" do
  @users = User.all
  slim :index
end

get '/page' do 
  slim :page
end

get "/assets/*" do
  env["PATH_INFO"].sub!("/assets", "")
  settings.environment.call(env)
end