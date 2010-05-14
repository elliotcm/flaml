module FLAML
  class Formatter
    require 'flaml/formatters/single_line_element'
    require 'flaml/formatters/multi_line_element'
    require 'flaml/formatters/plain_text_line'

    def self.format(fragment)
      if fragment.element?
        if fragment.single_line?
          return Formatters::SingleLineElement.format(fragment)
        else
          return Formatters::MultiLineElement.format(fragment)
        end
      else
        return Formatters::PlainTextLine.format(fragment)
      end
    end
  end
end

