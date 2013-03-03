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

        extract_document body, root

        {:document => root}
      end

      def extract_document element_parent, node_parent
        element_parent.children.each do |element|
          node_parent << convert(element)
        end
      end

      def convert element
        options = {}

        # TODO: Paragraph style when element is heading

        node = Parser::Node.new :p, options

        if element.element_children.empty?
          node << Parser::Node.new(:r) << Parser::Node.new(:t, {:text => element.text})
        end

        node
      end
    end
  end
end
