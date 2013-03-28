require 'helper'

class TestDocxtorDocumentParagraph < Test::Unit::TestCase
  context "creating paragraph from html element" do
    setup do
      doc = Nokogiri::HTML ""
      @paragraph = Nokogiri::XML::Node.new "p", doc
      @heading = Nokogiri::XML::Node.new "h1", doc
    end

    should "create Parser::Node element with children representing docx paragraph" do
      paragraph = Docxtor::Document::Paragraph.new @paragraph

      assert_equal :p, paragraph.paragraph.name
    end

    should "create heading parapgraph from heading element" do
      heading = Docxtor::Document::Paragraph.new @heading

      assert_equal "h1", heading.paragraph.children.first.children.
        find {|property| property.name == :pStyle}.
        attributes["w:val"]
    end
  end
end
