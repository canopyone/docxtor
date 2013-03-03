require 'helper'

class TestDocxtorBuilder < Test::Unit::TestCase
  context "Building a set of xml files for OOXML zip-archive" do
    setup do
      @builder = Docxtor::Builder.new
    end

    should "respond to #build" do
      assert_respond_to @builder, :build
    end

    should "create a string with main document body" do
      root = Docxtor::Parser::Node.new "root"
      root << Docxtor::Parser::Node.new(:p) << Docxtor::Parser::Node.new(:r) << Docxtor::Parser::Node.new(:t, {:text => "Hi"})
      context = {:document => root}

      files = @builder.build context

      template = File.read(File.join(File.dirname(__FILE__), 'support', 'document.xml'))
      xml = Builder::XmlMarkup.new
      document = eval(template)

      assert_equal document, files["word/document.xml"]
    end
  end
end
