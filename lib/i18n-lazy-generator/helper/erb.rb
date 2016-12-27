module I18n::Lazy::Generator
  module ERB
    def self.substitute_erb_with(text, &block)
      text.gsub(/(<%=.+?%>)/) { block.call($1) }
    end

    def self.escape_tags(text)
      text.gsub(/(^(<%=\s*))/, '').gsub(/((\s*%>)$)/, '')
    end

    def self.contains_link?(text)
      text.match(/(<%=.+?>)/).to_a.any? { |m| link?(m) }
    end

    def self.link?(text)
      !!(text =~ /link_to/)
    end

    def self.last_identifier(text)
      with_dots = text.scan(/((?<=\.)\w+(?=\W)*)/).flatten
      unless with_dots.empty? then
        with_dots.last
      else
        without_dots = text.scan(/(\w+(?=\W))/).flatten
        unless without_dots.empty? then
          without_dots.first
        else
          text
        end
      end
    end

    def self.link_label(text)
      text.match(/((((?<=link_to\s\()|(?<=link_to\()).+(?=,))|(((?<=link_to\s))[^\(].+(?=,)))/).to_s
    end
  end
end
