require 'builder'

require 'nokogiri/xml/element'

Dir["#{File.dirname(__FILE__)}/**/*.rb"].each { |f| require f }

module Docxtor
end
