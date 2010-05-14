module FLAML
  class Renderer
    require 'flaml/line'
    require 'flaml/compiler'

    def initialize(dom)
      @dom = dom
    end

    def self.render(dom)
      self.new(dom).render
    end

    def render
      # Compiler.compile(@dom).flatten.join("\n") + "\n"
    end

    private
    # def render_line(line)
    #   line = Line.new(line) unless line.is_a? Line
    #
    #   if @fragment_stack.empty?
    #     @fragment_stack << parse_for_new_fragment(line)
    #   else
    #     unless last_fragment.takes(line)
    #       @render_stack << @fragment_stack.pop.fragment_stack
    #       @fragment_stack << parse_for_new_fragment(line)
    #     end
    #   end
    # end

    # def flush_stack
    #   while fragment = @fragment_stack.pop do
    #     @render_stack << fragment.fragment_stack
    #   end
    # end
  end
end
