require 'helper'

class TestDocxtorDocumentParagraph < Test::Unit::TestCase
  should "create Parser::Node element with children representing docx paragraph" do
    doc = Nokogiri::HTML ""
    text_element = Nokogiri::XML::Node.new "p", doc
    paragraph = Docxtor::Document::Paragraph.new text_element

    assert_equal :p, paragraph.paragraph.name
  end
end
