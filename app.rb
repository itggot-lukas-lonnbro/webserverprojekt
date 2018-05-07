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
    user = User.get_by('username', params['username'])
    if user.authenticate(params['password'])
      puts "Authenticated"
      redirect '/'
    else
      puts "error: unable to authenticate user."
      redirect '/login'
    end
  end

  get '/sodukusolver' do
    slim :sodukusolver
  end
end
