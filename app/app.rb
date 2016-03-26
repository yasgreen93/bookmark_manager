ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'data_mapper_setup'
require_relative 'server'
require_relative 'controllers/users'
require_relative 'controllers/links'
require_relative 'controllers/sessions'

class Bookmark < Sinatra::Base

  get '/' do
    erb(:home)
  end

  post '/tags' do
    @tags = params[:tags] ||= ''
    @links = Link.all.select { |link| link.tags.first.name == @tags }
    erb(:'/links/index')
  end

  # get '/sessions/new' do
  #   erb :'sessions/new'
  # end
  #
  # post '/sessions' do
  #   user = User.authenticate(params[:address], params[:password])
  #   if user
  #     session[:user_id] = user.id
  #     redirect('/links')
  #   else
  #     flash.now[:errors] = ['The email or password is incorrect']
  #     erb :'sessions/new'
  #   end
  # end
  #
  # delete '/sessions' do
  #   session[:user_id] = nil
  #   flash.keep[:notice] = 'goodbye!'
  #   redirect to '/links'
  # end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
