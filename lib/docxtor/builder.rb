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

      Dir["#{File.dirname(__FILE__)}/../templates/**/{*,.*}.builder"].each { |filename| build_file filename }

      package
    end

    def build_file filename
      xml = ::Builder::XmlMarkup.new
      root = context[:document]
      template = File.read filename
      package[filename.gsub(/^.*templates\//, "").gsub(".builder", "")] = eval(template)
    end

    def place element, xml
      if element.children.empty?
        xml.w element.name.to_sym, element.attributes, element.content
      else
        xml.w element.name.to_sym do |xml|
          element.children.each {|child| place child, xml }
        end
      end
    end
  end
end
