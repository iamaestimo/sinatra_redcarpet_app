require 'sinatra/base'

module Sinatra
  module CustomParser

    def md_parse(text)
      text + "_is awesome_"
    end

  end

  helpers CustomParser

end