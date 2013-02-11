require 'helper'

class TestDocxtorHTMLParser < Test::Unit::TestCase
  context "Parsing html template" do
    setup do
      @parser = Docxtor::HTMLParser.new
    end

    should "respond to #parse" do
      assert_respond_to @parser, :parse
    end

    context "#parse" do
      should "extract context variables from html template" do
        template = "<html><body><div id='content'>Hello, docxtor!</div></body></html>"
        assert_equal([{:div => [{:text => ["Hello, docxtor!"]}]}], @parser.parse(template))
      end
    end
  end
end
