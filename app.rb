class App < Sinatra::Base
  enable :session

  get '/' do
    slim :home
  end

  get '/register' do
    slim :register
  end

  post '/register' do
    puts "we registered"
    redirect '/'
  end

  get '/login' do
    slim :login
  end

  post '/login' do
    redirect '/'
  end
end
