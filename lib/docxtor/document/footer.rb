require File.join(File.dirname(__FILE__), 'header_footer')

module Docxtor
  module Document
    class Footer < HeaderFooter
      def template
        "#{File.dirname(__FILE__)}/../../templates/word/footer.xml.builder"
      end

      def filename
        "word/footer#{num}.xml"
      end

      def target
        "footer#{num}.xml"
      end

      def reference_id
        "rId#{num+1}"
      end

      def reference_name
        :footerReference
      end
    end
  end
end
