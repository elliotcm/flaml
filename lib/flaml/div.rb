module FLAML
  class Div < FLAML::Renderer
    def initialize(line)
      @indentation = line.indentation
      @fragment_stack = []
      @render_output = []
    end

    attr_reader :indentation

    def to_html
      flush_stack

      return "<div></div>" if @render_output.empty?

      @render_output.unshift "<div>"
      @render_output.push "</div>"

      return flat_output
    end

    def takes(line)
      if line.empty? or line.indentation > self.indentation
        render_line(line)
        return true
      else
        return false
      end
    end
  end
end
