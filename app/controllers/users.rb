
class Bookmark < Sinatra::Base

  get '/users/sign_up' do
    @user = User.new
    erb :'users/sign_up'
  end

  post '/users' do
    @user = User.new(address: params[:email],
                     password: params[:pw], password_confirmation: params[:pw_conf])
    if @user.save
      session[:user_id] = @user.id
      redirect('/links')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/sign_up'
    end
  end

end
