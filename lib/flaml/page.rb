require 'lib/flaml/renderer'

module FLAML
  class Page
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
      return flat_output
    end

    def flat_output
      @render_output.join("\n") + "\n"
    end
  end
end
