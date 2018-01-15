class App < Sinatra::Base
  enable :session

  get '/' do
    slim :home
  end

  get '/register' do
    slim :register
  end

  post '/register' do
    puts "we did stuff."
    redirect '/'
  end

end
