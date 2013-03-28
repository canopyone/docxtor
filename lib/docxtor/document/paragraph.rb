module Docxtor
  module Document
    class Paragraph
      attr_accessor :paragraph

      def initialize element
        @element = element

        @paragraph = Parser::Node.new(:p)
        @paragraph << paragraph_options if paragraph_options

        run = Parser::Node.new(:r)
        run << run_options if run_options

        @paragraph << run << Parser::Node.new(:t, {:content => element.text})
      end

      private

      def paragraph_options
        if @element.name == "h1"
          pPr = Parser::Node.new(:pPr)
          pPr << Parser::Node.new(:spacing, {"w:before" => "120", "w:after" => "240"})
          pPr << Parser::Node.new(:pStyle, {"w:val" => "h1"})
        end
        pPr
      end

      def run_options
        if @element.name == "h1"
          rPr = Parser::Node.new(:rPr)
          rPr << Parser::Node.new(:sz, {"w:val" => "32"})
          rPr << Parser::Node.new(:szCs, {"w:val" => "32"})
        end
        rPr
      end
    end
  end
end
