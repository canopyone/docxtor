require 'helper'

class TestDocxtorHTMLParser < Test::Unit::TestCase
  context "Mapping html elements to docxx elements" do
    context "#paragraph?" do
      should "Decide if element considered a paragraph" do
        element = Nokogiri::XML::Element.new "p", Nokogiri::HTML::Document.new
        assert element.paragraph?
      end
    end

    context "#heading?" do
      should "Decide if element considered a heading" do
        element = Nokogiri::XML::Element.new "h1", Nokogiri::HTML::Document.new
        assert element.heading?
      end
    end
  end
end
