module FLAML
  class Compiler
    require 'flaml/formatter'
    def self.compile(dom)
      render_stack = []
      dom.fragments.each do |fragment|
        render_stack << Formatter.format(fragment)
      end
      return render_stack
    end
  end
end
