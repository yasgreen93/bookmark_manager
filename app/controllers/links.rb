
class Bookmark < Sinatra::Base
  
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

end
