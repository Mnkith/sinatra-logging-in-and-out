require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    # User.create(username: "MUNKITH", password: "Abid")
    erb :index
  end

  post '/login' do
    # binding.pry
    @user = User.find_by(username: params[:username])
    if @user
      session[:user_id] = @user.id
      redirect '/account'
    else
      erb :error
    end
  end

  get '/account' do
    if Helpers.is_logged_in? session
      @sess = session
    # binding.pry
      erb :account
    else
      erb :error
    end
  end

  get '/logout' do
    session.clear
    redirect '/'

  end


end

