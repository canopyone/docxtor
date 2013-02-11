module Docxtor
  class Generator
    attr_accessor :template, :path

    def from_html template, path
      @template = template
      @path = path

      generate :from => :html
    end

    def generate options = {}
      parser = options[:parser] ||= (options[:from] == :html) && Docxtor::HTMLParser.new
      builder = options[:builder] ||= Docxtor::Builder.new

      context = parser.parse template
      files = builder.build context
      save files
    end

    def save files_hash
      files_hash.each do |path, file|
        # Saving *file* objects on disk on given *path*
      end
    end
  end
end
