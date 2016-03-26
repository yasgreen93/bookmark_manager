ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'data_mapper_setup'
require_relative 'server'
require_relative 'controllers/users'

class Bookmark < Sinatra::Base

  get '/' do
    erb(:home)
  end

  get '/links' do
    @links = Link.all
    erb(:'/links/index')
  end

  get '/links/new' do
     erb(:'/links/new')
  end

  post '/links' do
    input = params[:tag].split(" ")
    tag_list = []
    input.each {|tag| tag_list << Tag.create(name: tag)}
    link = Link.create(url: params[:url], title: params[:title])
    tag_list.each {|tag| link.tags << tag}
    link.save
    redirect ('/links')
  end

  post '/tags' do
    @tags = params[:tags] ||= ''
    @links = Link.all.select { |link| link.tags.first.name == @tags }
    erb(:'/links/index')
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:address], params[:password])
    if user
      session[:user_id] = user.id
      redirect('/links')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
