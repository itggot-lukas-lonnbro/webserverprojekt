class App < Sinatra::Base
  enable :session

  get '/' do
    slim :home
  end

end
