require 'lib/flaml/parser'
require 'lib/flaml/renderer'

module FLAML
  class Page
    include Parser

    def self.render(page)
      self.new(page).render
    end

    def initialize(page)
      @page = page
      super()
    end

    def render
      @page.each do |line|
        parse_line(line)
      end

      return Renderer.render(self)
    end

    def flat_output
      @render_stack.join("\n") + "\n"
    end
  end
end
