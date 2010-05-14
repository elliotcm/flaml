module FLAML
  class Line
    def initialize(haml_line)
      @element = @empty = false

      haml_line =~ /\s*(.*)/
      @body = $1 || ''

      if @body == ''
        @empty = true
      elsif @body =~ /%(\w+)(?:\s+(.+))?$/
        @tag = $1
        @content = $2 || ''
        @element = true
      end
    end

    attr_reader:content, :tag

    def to_html
      @body
    end

    def element?
      @element
    end

    def div?
      element? and @tag == 'div'
    end

    def empty?
      @empty
    end
  end
end
