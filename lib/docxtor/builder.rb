require 'builder'

module Docxtor
  # Builder of the .docx document.
  # Implements some parts of the ECMA-376 Open XML standart.
  # http://www.ecma-international.org/publications/standards/Ecma-376.htm
  class Builder
    attr_accessor :context, :package

    def build context
      @context = context
      @templates_dir = File.join(File.dirname(__FILE__), '..', 'templates')
      @package = {}

      build_rels
      build_content_types
      build_document

      package
    end

    def build_rels
      xml = ::Builder::XmlMarkup.new
      template = File.read(File.join @templates_dir, '_rels', '.rels.builder')
      package["_rels/.rels"] = eval(template)
    end

    def build_content_types
      xml = ::Builder::XmlMarkup.new
      template = File.read(File.join @templates_dir, '[Content_Types].xml.builder')
      package["[Content_Types].xml"] = eval(template)
    end

    def build_document
      xml = ::Builder::XmlMarkup.new
      root = context[:document]
      template = File.read(File.join @templates_dir, 'word', 'document.xml.builder')
      package["word/document.xml"] = eval(template)
    end

    def place element, xml
      if element.children.empty?
        xml.w element.name.to_sym, element.attributes[:text]
      else
        xml.w element.name.to_sym do |xml|
          element.children.each {|child| place child, xml }
        end
      end
    end
  end
end
