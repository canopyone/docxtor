require 'nokogiri'

module Docxtor
  module Parser
    class HTML
      attr_accessor :template, :root

      def initialize options = {}
        @root = Parser::Node.new 'root'
      end

      def parse template
        @template = template

        doc = Nokogiri::HTML(template)
        body = doc.css('body')[0]

        body.xpath("//text()").each {|text| root << convert(text)}

        {:document => root}
      end

      def convert element
        options = {}
        # options = extract_options(element.parent)

        node = Parser::Node.new(:p, options)
        node << Parser::Node.new(:r) << Parser::Node.new(:t, {:text => element.text})

        node
      end
    end
  end
end
