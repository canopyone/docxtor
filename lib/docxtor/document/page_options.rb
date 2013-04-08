module Docxtor
  module Document
    class PageOptions
      attr_accessor :headers_footers

      def initialize options
        @headers_footers = []

        [[:headers, Header], [:footers, Footer]].each do |kind, klass|
          if options[kind]
            i = 1
            [:first, :odd, :even].each do |pages|
              if options[kind][pages]
                @headers_footers << klass.new(pages, options[kind].delete(pages), i)
                i += 1
              end
            end

            @headers_footers << klass.new(:default, options[kind], i) unless options[kind].empty?
          end
        end
      end
    end
  end
end
