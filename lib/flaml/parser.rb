module FLAML
  module Parser
    require 'flaml/text_line'
    require 'flaml/element'
    require 'flaml/line'

    def initialize(indentation=0)
      @indentation = indentation
      @fragments = []
    end

    attr_reader :indentation, :fragments

    private
    def parse_line(line)
      line = Line.new(line) unless line.is_a? Line

      if @fragments.empty? or !last_fragment.takes(line)
        @fragments << parse_for_new_fragment(line)
      end
    end

    def parse_for_new_fragment(line)
      return Element.new(line, indentation + 1) if line.element?
      return TextLine.new(line, indentation + 1)
    end

    def last_fragment
      @fragments.last
    end
  end
end
