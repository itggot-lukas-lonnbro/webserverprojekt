#Use bundler to load gems
require 'bundler'

#Load gems
Bundler.require

#Load the app
require_relative 'app.rb'

#Load models

#Setup options
Slim::Engine.set_options pretty: true, sort_attrs: false

#Run the app
run App
