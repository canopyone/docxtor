module Docxtor
  module Parser
    class Node
      attr_accessor :name, :attributes, :parent, :children, :content

      def initialize name, attributes = {}
        @name = name
        @children = []
        @content = attributes.delete(:content)
        @attributes = attributes
      end

      def <<(child)
        children << child
        child
      end

      def remove(child)
        children.delete child
        self
      end
    end
  end
end
