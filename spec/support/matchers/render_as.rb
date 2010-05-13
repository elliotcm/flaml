Spec::Matchers.define :render_as do |expected_html|
  def trim_whitespace(html)
    html_lines = html.split("\n")
    html_lines.shift if html_lines.first =~ /^\s*$/
    html_lines.pop if html_lines.last =~ /^\s*$/

    return remove_base_indentation(html_lines).push("").join("\n")
  end

  def get_base_indentation(strings)
    strings.map do |string|
      string =~ /^(\s*)/
      $1.nil? ? 0 : $1.length
    end.min
  end

  def remove_base_indentation(strings)
    base_indentation = get_base_indentation(strings)
    strings.map do |string|
      string.slice(base_indentation..-1)
    end
  end

  trimmed_expectation = trim_whitespace(expected_html)

  match do |actual_html|
    actual_html == trimmed_expectation
  end

  failure_message_for_should do |actual|
    "#{actual}\nshould have rendered as:\n\n#{trimmed_expectation}"
  end

  failure_message_for_should_not do |actual|
    "#{actual}\nshould not have rendered as:\n\n#{trimmed_expectation}"
  end
end
