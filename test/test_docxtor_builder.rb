require 'helper'

class TestDocxtorBuilder < Test::Unit::TestCase
  context "Building a set of xml files for OOXML zip-archive" do
    setup do
      root = Docxtor::Parser::Node.new "root"
      root << Docxtor::Parser::Node.new(:p) << Docxtor::Parser::Node.new(:r) << Docxtor::Parser::Node.new(:t, {:content => "Hi"})
      @context = {:document => root}

      @builder = Docxtor::Builder.new
    end

    should "respond to #build" do
      assert_respond_to @builder, :build
    end

    should "create a string with main document body" do
      files = @builder.build @context

      template = File.read(File.join(File.dirname(__FILE__), 'support', 'document.xml.builder'))
      xml = Builder::XmlMarkup.new
      document = eval(template)

      assert_equal document, files["word/document.xml"]
    end

    context "footer option is provided" do
      setup do
        @context = {:document => Docxtor::Parser::Node.new("root")}
        page_options = Docxtor::Document::PageOptions.new :footers => {:content => "Foo", :align => :right}
        builder = Docxtor::Builder.new page_options
        @files = builder.build @context
      end

      should "include a footer in document if option is provided" do
        template = File.read(File.join(File.dirname(__FILE__), 'support', 'document_with_footer.xml.builder'))
        xml = Builder::XmlMarkup.new
        document = eval(template)

        assert_equal document, @files["word/document.xml"]
      end

      should "align footer content" do
        template = File.read(File.join(File.dirname(__FILE__), 'support', 'default_footer.xml.builder'))
        xml = Builder::XmlMarkup.new
        footer = eval(template)

        assert_equal footer, @files["word/footer1.xml"]
      end

      should "insert dynamic field in footer if option is provided" do
        page_options = Docxtor::Document::PageOptions.new :footers => {:content => :pagenum}
        builder = Docxtor::Builder.new page_options
        files = builder.build @context

        template = File.read(File.join(File.dirname(__FILE__), 'support', 'pagenum_footer.xml.builder'))
        xml = Builder::XmlMarkup.new
        footer = eval(template)

        assert_equal footer, files["word/footer1.xml"]
      end

      should "use correct type of footer" do
        page_options = Docxtor::Document::PageOptions.new :footers => {:first => {:content => "Foo"}}
        builder = Docxtor::Builder.new page_options
        files = builder.build @context

        template = File.read(File.join(File.dirname(__FILE__), 'support', 'document_with_first_footer.xml.builder'))
        xml = Builder::XmlMarkup.new
        document = eval(template)

        assert_equal document, files["word/document.xml"]
      end

      should "create multiple footers if needed" do
        page_options = Docxtor::Document::PageOptions.new :footers => {:first => {:content => "Foo"}, :even => {:content => "Bar"}, :odd => {:content => "Baz"}}
        builder = Docxtor::Builder.new page_options
        files = builder.build @context

        template = File.read(File.join(File.dirname(__FILE__), 'support', 'document_with_many_footers.xml.builder'))
        xml = Builder::XmlMarkup.new
        document = eval(template)

        assert_equal document, files["word/document.xml"]
      end
    end
  end
end
