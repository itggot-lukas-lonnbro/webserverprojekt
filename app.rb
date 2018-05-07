class App < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride

  before '*' do
    @user = session[:user]
  end

  get '/' do
    slim :home
  end

  get '/users/new' do #Registration form
    slim :register
  end

  post '/users' do #Authenticate and record information
    error = User.add(params)
    if error
      puts "error: #{error}"
      redirect '/users/new'
    else
      redirect '/'
    end
  end

  get '/session/new' do #Get login form
    slim :login
  end

  post '/session' do #Create session and authenticate User.
    user = User.get_by('username', params['username'])
    if user.authenticate(params['password'])
      puts "Authenticated"
      session[:user] = user
      redirect '/'
    else
      puts "error: unable to authenticate user."
      redirect '/session/new'
    end
  end

  delete '/sessions' do #Clear login cookie
    session.clear
    redirect '/'
  end

  get '/sodukusolver/new' do #Get sudoku form
    slim :sodukusolver
  end

  post '/sodukusolver' do #Save sudoku
    redirect '/sudokusolver/new'
  end
end
