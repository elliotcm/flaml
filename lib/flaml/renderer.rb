module FLAML
  class Renderer
    def self.render(haml)
      if haml =~ /%(\w+)/
        return "<#{$1}></#{$1}>"
      end
    end
  end
end
