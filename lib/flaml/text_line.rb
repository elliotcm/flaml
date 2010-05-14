module FLAML
  require 'flaml/fragment'
  class TextLine < Fragment
    def initialize(line, indentation)
      super(line, indentation)
      @content = line.content
    end

    attr_reader :content

    def element?
      false
    end

    def single_line?
      true
    end

    def takes(line)
      false
    end
  end
end
