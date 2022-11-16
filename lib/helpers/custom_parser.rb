require 'sinatra/base'
require 'redcarpet'


module Sinatra
  module CustomParser

    def markdown_output(input)
      # define basic MD renderer
      renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
      markdown = Redcarpet::Markdown.new(renderer, extensions = {})
      output = markdown.render(input)

      # return parsed output
      output
    end

  end

  helpers CustomParser

end