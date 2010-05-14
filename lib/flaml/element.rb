module FLAML
  class Element < Fragment
    def initialize(line, indentation)
      super(line, indentation)
      @tag = line.tag
    end

    def single_line?
      @content != '' or @fragments.empty?
    end

    def element?
      true
    end

    attr_reader :tag, :content
    #
    #
    # def to_html
    #   return "<#{@tag}>#{@line.content}</#{@tag}>" if self.single_line?
    #   flush_stack
    #   return "<#{@tag}></#{@tag}>" if @render_stack.empty?
    #   indent_tag_content
    #   wrap_tag_content
    #   multiline_output
    # end
    #
    def takes(line)
      return false if self.single_line?

      return true if line.empty?

      if line.indentation > self.indentation
        parse_line(line)
        return true
      end

      # flush_stack
      return false
    end
    #
    # private
    # def indent_tag_content
    #   @render_stack.map! do |line|
    #      "  " + line
    #   end
    #   puts @render_stack.inspect
    # end
    #
    # def wrap_tag_content
    #   @render_stack.unshift "<#{@tag}>"
    #   @render_stack.push "</#{@tag}>"
    # end
    #
    # def multiline_output
    #   @render_stack.join("\n")
    # end
  end
end
