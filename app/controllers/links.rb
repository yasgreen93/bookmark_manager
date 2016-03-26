
class Bookmark < Sinatra::Base

  get '/links' do
    user = User.get(session[:user_id])
    @links = Link.all(user_id: user.id) || []
    erb(:'/links/index')
  end

  get '/links/new' do
    user = User.get(session[:user_id])
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
