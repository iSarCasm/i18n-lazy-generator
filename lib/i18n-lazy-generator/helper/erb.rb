module I18n::Lazy::Generator
  module ERB
    def self.map(text, &block)
      text.gsub(/(<%=.+?%>)/) { block.call($1) }
    end

    def self.escape(text)
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
      if with_dots.empty? then
        without_dots = text.scan(/(\w+(?=\W))/).flatten
        unless without_dots.empty? then
          without_dots.first
        else
          text
        end
      else
        with_dots.last
      end
    end

    def self.link_label(text)
      text.match /(((?<=link_to\s\()|(?<=link_to\()).+(?=,))/
    end
  end
end
