module FLAML
  module Formatters
    class PlainTextLine
      def self.format(fragment)
        [fragment.content]
      end
    end
  end
end
