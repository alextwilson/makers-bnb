ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/models/database_setup.rb'

class DwellBNB < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/users' do
    session[:name] = params[:name]
    redirect '/users'
  end

  get '/users' do
    @name = session[:name]
    erb :users
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    Space.create(name: params[:name])
    redirect '/spaces'
  end

  get '/spaces' do
    @listings = Space.all
    erb :'spaces/listings'
  end
end
