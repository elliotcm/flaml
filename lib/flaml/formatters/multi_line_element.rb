module FLAML
  module Formatters
    class MultiLineElement
      def self.format(fragment)
        ["<#{fragment.tag}>", Compiler.compile(fragment), "</#{fragment.tag}>"]
      end
    end
  end
end
