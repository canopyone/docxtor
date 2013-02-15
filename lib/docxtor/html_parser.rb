require 'nokogiri'

module Docxtor
  # HTML templates parser. Represents data in a hash, translates tags names to +.docx+ terms.
  # Kinda.
  class HTMLParser
    attr_accessor :data, :template

    def initialize options = {}
      @data = {:document => []}
      @options = options
    end

    def parse template
      doc = Nokogiri::HTML(template)
      nodes = doc.css('body')[0].children

      extract_document nodes

      data
    end

    # TODO: to closely tied with Nokogiri::XML::Node?
    def paragraph? node
      ["div", "p"].include? node.name
    end

    def heading? node
      node.name =~ /^h\d$/
    end

    def header? node
      node.document.css(@options[:header]).include? node
    end

    def toc? node
    end

    private

    def extract_document nodes, append_to = data[:document]
      nodes.each do |node|
        key = translate node
        append_to << {key => []}
        if node.element_children.empty?
          append_to.last[key] << node.text
        else
          extract_document(node.children, append_to.last[key])
        end
      end
    end

    def translate node
      if paragraph? node
        key = :p
      elsif heading? node
        key = node.name.to_sym
      else
        key = :run # run of text (see standart)
      end
    end
  end
end
