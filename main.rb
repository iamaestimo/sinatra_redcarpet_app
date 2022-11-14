require 'sinatra'
require 'sinatra/reloader' if development?
require 'redcarpet'

class Main < Sinatra::Application

  get '/' do
    erb :index, layout: :layout
  end

  post '/parse_md' do
  	# define basic MD renderer
  	renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
  	markdown = Redcarpet::Markdown.new(renderer, extensions = {})

  	input = params[:md_input]
  	@post = markdown.render(input)

  	erb :parse_md, layout: :layout
  end

end