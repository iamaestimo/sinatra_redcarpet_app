require 'sinatra'
require 'sinatra/reloader' if development?
require_relative './lib/helpers/custom_parser'

class Main < Sinatra::Application
	# include custom MD parsing helper
	helpers Sinatra::CustomParser	

  get '/' do
    erb :index, layout: :layout
  end

  post '/parse_md' do
  	input = params[:md_input]
    @post = md_parse(input)

  	erb :parse_md, layout: :layout
  end

end