require 'sinatra'
require 'sinatra/reloader' if development?
require 'redcarpet'

class Main < Sinatra::Application

  get '/' do
  	# define basic MD renderer
  	renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
  	markdown = Redcarpet::Markdown.new(renderer, extensions = {})

    @post = markdown.render("This is absolutely *awesome*.")
    erb :index, layout: :layout
  end

end