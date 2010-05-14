module FLAML
  class Fragment
    include Parser

    def initialize(line, indentation)
      super(indentation)
      @line = line
      @content = line.content if self.single_line?
    end
  end
end
