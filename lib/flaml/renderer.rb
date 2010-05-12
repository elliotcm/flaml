module FLAML
  class Renderer
    require 'flaml/div'

    def self.render(haml)
      haml.each do |line|
        if line =~ /%div/
          return Div.new.to_html
        end
      end
    end
  end
end
