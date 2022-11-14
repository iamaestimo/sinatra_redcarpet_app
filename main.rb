require 'sinatra'
require 'sinatra/reloader' if development?
require 'redcarpet'
require_relative './lib/helpers/custom_parser'

class Main < Sinatra::Application
	# include custom MD parsing helper
	helpers Sinatra::CustomParser	

  get '/' do
    erb :index, layout: :layout
  end

  post '/parse_md' do
  	# define basic MD renderer
  	renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
  	markdown = Redcarpet::Markdown.new(renderer, extensions = {})

  	input = params[:md_input]
  	# @post = markdown.render(input)
  	@post = md_parse(input)

  	erb :parse_md, layout: :layout
  end

end