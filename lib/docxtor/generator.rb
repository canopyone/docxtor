require 'fileutils'
require "zip/zip"

module Docxtor
  class Generator
    attr_accessor :template, :path

    def from_html template, path
      @template = template
      @path = path

      generate :from => :html
    end

    def generate options = {}
      parser = options[:parser] ||= (options[:from] == :html) && Docxtor::Parser::HTML.new
      builder = options[:builder] ||= Docxtor::Builder.new

      context = parser.parse template
      files = builder.build context
      save files
    end

    private

    def save files_hash
      Zip::ZipFile.open(path, Zip::ZipFile::CREATE) do |io|
        files_hash.each do |path, content|
          io.get_output_stream(path) {|file| file << content }
        end
      end
    end
  end
end
