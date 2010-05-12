module FLAML
  class Renderer
    require 'flaml/div'
    require 'flaml/line'

    def self.render(page)
      self.new(page).render
    end

    def initialize(page)
      @page = page
      @fragment_stack = []
      @render_output = []
    end

    def render
      @page.each do |line|
        render_line(line)
      end

      flush_stack

      return flat_output + "\n"
    end

    def flat_output
      @render_output.join("\n")
    end

    def render_line(line)
      line = FLAML::Line.new(line) unless line.is_a? FLAML::Line

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

    private
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
