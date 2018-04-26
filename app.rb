class App < Sinatra::Base
  enable :session
  register Sinatra::Flash

  get '/' do
    slim :home
  end

  get '/register' do
    slim :register
  end

  post '/register' do
    error = User.add(params)
    if error
      puts "error: #{error}"
      redirect '/register'
    else
      redirect '/'
    end
  end

  get '/login' do
    slim :login
  end

  post '/login' do
    redirect '/'
  end
end
