module FLAML
  module Renderer
    require 'flaml/div'
    require 'flaml/line'

    def initialize
      @indentation = 0
      @fragment_stack = []
      @render_output = []
    end

    private
    def flat_output
      @render_output.map do |line|
         " " * @indentation + line
      end.join("\n")
    end

    def render_line(line)
      line = Line.new(line) unless line.is_a? Line

      if @fragment_stack.empty?
        @fragment_stack << parse_for_new_fragment(line)
      else
        unless last_fragment.takes(line)
          @render_output << @fragment_stack.pop.to_html
          @fragment_stack << parse_for_new_fragment(line)
        end
      end
    end

    def parse_for_new_fragment(line)
      if line.div?
        return Div.new(line)
      else
        return line
      end
    end

    def last_fragment
      @fragment_stack.last
    end

    def flush_stack
      while fragment = @fragment_stack.pop do
        @render_output << fragment.to_html
      end
    end
  end
end
