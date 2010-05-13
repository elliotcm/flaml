module FLAML
  class Line
    def initialize(haml_line)
      @element = @empty = false

      haml_line =~ /(\s*)(.*)/
      @indentation = ($1.nil? ? 0 : $1.length)
      @body = $2 || ''

      if @body == ''
        @empty = true
      elsif @body =~ /%(\w+)/
        @tag = $1
        @element = true
      end
    end

    attr_reader :indentation

    def to_html
      '  ' + @body
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
