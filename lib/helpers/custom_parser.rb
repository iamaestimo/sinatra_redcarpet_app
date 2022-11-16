require 'sinatra/base'
require 'redcarpet'


module Sinatra
  module CustomParser

    def md_parse(input)
      # define basic MD renderer
      renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
      markdown = Redcarpet::Markdown.new(renderer, extensions = {})
      post = markdown.render(input)

      # return parsed output
      post
    end

  end

  helpers CustomParser

end