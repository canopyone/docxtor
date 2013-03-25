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

        body.xpath("//text()").each {|text| root << Document::Paragraph.new(text).paragraph}

        {:document => root}
      end
    end
  end
end
