require 'sinatra/base'
ENV['RACK_ENV'] ||= 'development'
require_relative 'data_mapper_setup'

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
    link = Link.create(title: params[:title], url: params[:url])
    tag = Tag.create(tag_name: params[:tags])
    link.tags << tag
    link.save
    redirect(:links)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
