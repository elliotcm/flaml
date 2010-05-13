require 'lib/flaml/renderer'

module FLAML
  class Div
    include FLAML::Renderer

    def initialize(line)
      super()
      @indentation = line.indentation
    end

    attr_reader :indentation

    def to_html
      flush_stack

      if @render_output.empty?
        @render_output.push "<div></div>"
      else
        @render_output.unshift "<div>"
        @render_output.push "</div>"
      end

      return flat_output
    end

    def takes(line)
      if line.empty? or line.indentation > self.indentation
        render_line(line)
        return true
      else
        flush_stack
        return false
      end
    end
  end
end
