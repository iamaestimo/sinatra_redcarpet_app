require 'sinatra'
require 'sinatra/reloader' if development?
require_relative './lib/helpers/custom_parser'

class Main < Sinatra::Application
	# include custom helpers for parsing Markdown
	helpers Sinatra::CustomParser	

  get '/' do
    erb :index, layout: :layout
  end

  post '/output' do
  	input = params[:md_input]
    @output = convert_markdown(input)

  	erb :markdown_output, layout: :layout
  end

end