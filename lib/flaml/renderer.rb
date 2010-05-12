module FLAML
  class Renderer
    require 'flaml/div'

    def self.render(haml)
      if haml =~ /%div/
        Div.new.to_html
      end
    end
  end
end
