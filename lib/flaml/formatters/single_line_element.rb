module FLAML
  module Formatters
    class SingleLineElement
      def self.format(fragment)
        ["<#{fragment.tag}>#{fragment.content}</#{fragment.tag}>"]
      end
    end
  end
end
