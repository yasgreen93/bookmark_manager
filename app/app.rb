require 'sinatra/base'
ENV['RACK_ENV'] ||= 'development'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base

  get '/' do
    redirect(:links)
  end

  get '/links' do
    @links = Link.all
    erb(:links)
  end

  get '/add_link' do
    erb(:add_link)
  end

  post '/add_link' do
    title = params[:title]
    url   = params[:url]
    Link.create(title: title, url: url)
    redirect(:links)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
