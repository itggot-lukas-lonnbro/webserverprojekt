class App < Sinatra::Base
  enable :session

  get '/' do
    p User.get_by_role("lukas")
    slim :home
  end

  get '/register' do
    slim :register
  end

  post '/register' do
    User.add(params)
    redirect '/'
  end

  get '/login' do
    slim :login
  end

  post '/login' do
    redirect '/'
  end
end
