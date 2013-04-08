module Docxtor
  module Document
    class HeaderFooter
      attr_accessor :pages, :field, :align, :text, :num

      Field = Struct.new(:type, :content)

      def initialize pages, options, num
        @pages = pages
        @align = options[:align]
        @num = num

        raise ArgumentError, "No :content provided for #{self} #{pages}" unless options[:content]
        convert_content options[:content]
      end

      def build &block
        yield(self, template, filename)
      end

      private

      def convert_content content
        if content == :pagenum
          @field = Field.new("PAGE", "i")
        else
          @text = content.to_s
        end
      end
    end
  end
end
