require 'helper'

class TestDocxtorHTMLParser < Test::Unit::TestCase
  context "Parsing html template" do
    setup do
      @parser = Docxtor::Parser::HTML.new
      @doc = Nokogiri::HTML(@template)
    end

    should "respond to #parse" do
      assert_respond_to @parser, :parse
    end

    context "#parse" do
      context "with minimal document" do
        setup do
          template = "<html><body></body></html>"
          @result = @parser.parse(template)
        end

        should "contain a document part" do
          assert @result[:document]
        end

        should "return a root node of resulting tree in document part" do
          assert_equal @result[:document].name, "root"
        end
      end

      context "with simple paragraph" do
        should "translate simple paragraph to .docx paragraph" do
          template = "<html><body><p>Paragraph</p></body></html>"
          result = @parser.parse(template)

          text = result[:document].children.find {|node| node.name == :p}.
            children.find {|node| node.name == :r}.
            children.find {|node| node.name == :t}.content
          assert_equal 'Paragraph', text
        end
      end

      context "with nested paragraph" do
        should "translate nested paragraphs to simple .docx paragraphs" do
          template = "<html><body><div>Outer div<p>Inner paragraph</p></div></body></html>"
          result = @parser.parse(template)

          assert_equal 2, result[:document].children.select {|node| node.name == :p}.count
        end
      end

      context "with heading element" do
        should "translate heading element to paragraph with heading properties" do
          template = "<html><body><h1>Heading</h1></body></html>"
          result = @parser.parse(template)

          assert_equal "h1", result[:document].children.first.children.
            find {|child| child.name == :pPr}.children.
            find {|property| property.name == :pStyle}.attributes["w:val"]
        end
      end
    end
  end
end
