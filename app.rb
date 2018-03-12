class App < Sinatra::Base
  enable :session

  get '/' do
    pp User.get_all
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
    puts "we logged in"
    redirect '/'
  end
end
