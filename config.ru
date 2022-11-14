require 'rubygems'
require 'bundler'

Bundler.require 

require_relative './main'

map '/' do
  run Main
end