require 'helper'

class TestDocxtor < Test::Unit::TestCase
  context "Generating from html" do
    setup do
      @docxtor = Docxtor::Generator.new

      # TODO: change to reading from sample template file
      @template = "<html><body><div id='content'>Hello, docxtor!</div></body></html>"
      @path = "./test.docx"
    end

    should "respond to #from_html" do
      assert_respond_to @docxtor, :from_html
    end

    context "#from_html" do
      should "accept template and path arguments" do
        assert_block do
          @docxtor.from_html @template, @path
        end
      end
    end

    context "#generate" do
      should "generate .docx file from html" do
        parser = Docxtor::HTMLParser.new
        parser_output = {:content => "Hello, docxtor!"}
        parser.expects(:parse).with(@template).returns(parser_output)

        builder = Docxtor::Builder.new
        builder_output = {"[Content_Types].xml" => "Some file"}
        builder.expects(:build).with(parser_output).returns(builder_output)

        @docxtor.expects(:save).returns(true)
        @docxtor.template = @template
        @docxtor.path = @path

        assert @docxtor.generate :from => :html, :parser => parser, :builder => builder
      end
    end
  end
end
