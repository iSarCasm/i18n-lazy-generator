require 'haml'

module LazyTranslate
  module Haml
    class Parser < ::Haml::Parser
      def initialize(options)
        super(options)
        @text_elements = []
      end

      def call(template)
        super(template)
        @text_elements
      end

      private

      def plain(line)
        match = line.full.match /\w(.+)$/
        offset = match.offset(0)
        @text_elements << TextElement.new(parsed_element: nil, content: line.text, start: offset.first, finish: offset.last, line: line.index)
        super(line)
      end
    end
  end
end
