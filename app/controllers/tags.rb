class Bookmark < Sinatra::Base

  post '/tags' do
    @tags = params[:tags] ||= ''
    @links = Link.all.select { |link| link.tags.first.name == @tags }
    erb(:'/links/index')
  end
  
end
