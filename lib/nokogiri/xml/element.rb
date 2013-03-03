require 'nokogiri'

Nokogiri::XML::Element.class_eval do
  def paragraph?
    ["div", "p"].include? name
  end

  def heading?
    name =~ /^h\d$/
  end
end
