require 'nokogiri'

module Docxtor
  class HTMLParser
    attr_accessor :data, :template

    def initialize options = {}
      @data = []
      @options = options
    end

    def parse template
      doc = Nokogiri::HTML(template)
      nodes = doc.css('body')[0].children

      extract_data nodes

      #TODO: Table of contents, footers and headers parser

      data
    end

    private

    def extract_data nodes, append_to = data
      nodes.each do |node|
        key = node.name.to_sym
        append_to << {key => []}
        if node.children.empty?
          append_to.last[key] << node.text
        else
          extract_data(node.children, append_to.last[key])
        end
      end
    end
  end
end
