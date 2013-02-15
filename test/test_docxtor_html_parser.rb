require 'helper'

class TestDocxtorHTMLParser < Test::Unit::TestCase
  context "Parsing html template" do
    setup do
      @parser = Docxtor::HTMLParser.new
      @template = File.read(File.join(File.dirname(__FILE__), 'support', 'template.html'))
      @doc = Nokogiri::HTML(@template)
    end

    should "respond to #parse" do
      assert_respond_to @parser, :parse
    end

    context "#parse" do
      should "extract context variables from html template" do
        assert_equal({:document => [{:h1 => ["Heading"]}, {:p => [{:run => ["Hello, docxtor!"]}, {:p => ["Nice to meet you!"]}]}]}, @parser.parse(@template))
      end
    end

    context "#paragraph?" do
      should "define whether given node should be translated to paragraph element" do
        assert @parser.paragraph? @doc.css('div')[0]
      end
    end

    context "#heading?" do
      should "define wheter given node should be translated to heading element" do
        assert @parser.heading? @doc.css('h1')[0]
      end
    end
  end
end
