require 'helper'

# Header works exactly the same way
class TestDocxtorDocumentFooter < Test::Unit::TestCase
  context "Store page footer info" do
    context "#initialize" do
      should "assign passed string to 'text' attribute" do
        footer = Docxtor::Document::Footer.new :default, {:content => "Foo"}, 1

        assert_equal "Foo", footer.text
      end

      should "convert :pagenum option to field attribute" do
        footer = Docxtor::Document::Footer.new :default, {:content => :pagenum}, 1

        assert_equal "PAGE", footer.field.type
        assert_equal "i", footer.field.content
      end
    end
  end
end
