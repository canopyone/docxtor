module Docxtor
  class Builder
    attr_accessor :context, :package, :page_options

    def initialize page_options = nil
      @page_options = page_options
    end

    def build context
      @context = context
      @templates_dir = File.join(File.dirname(__FILE__), '..', 'templates')
      @package = {}

      build_headers_footers
      build_document
      build_files

      package
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

    def references
      {"word/document.xml.rels" => {"styles.xml" => "rId1"},
        "_rels/.rels" => {}}
    end

    def templates
      {:files => ["[Content_Types].xml.builder", "word/_rels/document.xml.rels.builder", "word/styles.xml.builder", "_rels/.rels.builder"],
        :document => "word/document.xml.builder"}
    end

    private

    def build_headers_footers
      page_options.headers_footers.each do |hf|
        hf.build do |item, template, filename|
          @item = item
          build_file template, filename
        end
      end if page_options
    end

    def build_document
      template = "#{File.dirname(__FILE__)}/../templates/#{templates[:document]}"
      @root = context[:document]
      build_file template
    end

    def build_files
      templates[:files].each do |file|
        template = "#{File.dirname(__FILE__)}/../templates/#{file}"
        build_file template
      end
    end

    def build_file template_name, filename = nil
      xml = ::Builder::XmlMarkup.new
      template = File.read template_name
      filename ||= template_name.gsub(/^.*templates\//, "").gsub(".builder", "")
      package[filename] = eval(template)
    end
  end
end
