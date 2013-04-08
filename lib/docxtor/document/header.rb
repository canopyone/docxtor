require File.join(File.dirname(__FILE__), 'header_footer')

module Docxtor
  module Document
    class Header < HeaderFooter
      def template
        "#{File.dirname(__FILE__)}/../../templates/word/header.xml.builder"
      end

      def filename
        "word/header#{num}.xml"
      end

      def target
        "header#{num}.xml"
      end

      def reference_id
        "rId#{num+4}"
      end

      def reference_name
        :headerReference
      end
    end
  end
end
