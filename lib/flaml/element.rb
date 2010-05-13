module FLAML
  class Element
    include Renderer

    def initialize(line)
      super()
      @line = line
      @indentation = line.indentation
      @tag = line.tag
    end

    def single_line?
      @line.single_line?
    end

    attr_reader :indentation

    def to_html
      return "<#{@tag}>#{@line.content}</#{@tag}>" if self.single_line?
      flush_stack
      return "<#{@tag}></#{@tag}>" if @render_output.empty?
      indent_tag_content
      wrap_tag_content
      multiline_output
    end

    def takes(line)
      if self.single_line?
        @render_output << @line.content
        return false
      end

      if line.empty? or line.indentation > self.indentation
        render_line(line)
        return true
      end

      flush_stack
      return false
    end

    private
    def indent_tag_content
      @render_output.map! do |line|
         "  " + line
      end
      puts @render_output.inspect
    end

    def wrap_tag_content
      @render_output.unshift "<#{@tag}>"
      @render_output.push "</#{@tag}>"
    end

    def multiline_output
      @render_output.join("\n")
    end
  end
end
