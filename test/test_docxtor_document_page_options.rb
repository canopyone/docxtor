require 'helper'

class TestDocxtorDocumentPageOptions < Test::Unit::TestCase
  context "#initialize" do
    context "define a header/footer" do
      should "create footers from hash argument" do
        page_options = Docxtor::Document::PageOptions.new(:footers => {:content => "Foo"})

        assert_instance_of Docxtor::Document::Footer, page_options.headers_footers.first
      end

      should "create multiple footers if multiple options provided" do
        page_options = Docxtor::Document::PageOptions.new(:footers => {:odd => {:content => "Foo"}, :even => {:content => "Bar"}})

        assert_equal 2, page_options.headers_footers.count
      end
    end
  end
end
