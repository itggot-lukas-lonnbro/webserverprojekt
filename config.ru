#Use bundler to load gems
require 'bundler'
require 'pp'

#Load gems
Bundler.require

#Load the app
require_relative 'app.rb'

#Load models
require_relative 'models/model.rb'
require_relative 'models/user.rb'

#Setup options
Slim::Engine.set_options pretty: true, sort_attrs: false

#Run the app
run App
