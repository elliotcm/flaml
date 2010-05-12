module FLAML
  module Renderer
    require 'flaml/div'
    require 'flaml/line'

    def initialize
      @fragment_stack = []
      @render_output = []
    end

    private
    def flat_output
      @render_output.join("\n")
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

  class PageRenderer
    include FLAML::Renderer

    def self.render(page)
      self.new(page).render
    end

    def initialize(page)
      @page = page
      super()
    end

    def render
      @page.each do |line|
        render_line(line)
      end

      flush_stack

      return flat_output + "\n"
    end
  end
end
