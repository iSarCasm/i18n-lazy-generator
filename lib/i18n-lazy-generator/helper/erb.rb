module I18n::Lazy::Generator
  module ERB
    def self.interpolate(text, &block)
      text.gsub(/(<%=.+?>)/) { block.call($1) }
    end

    def self.contains_link?(text)
      text.match(/(<%=.+?>)/).to_a.any? { |m| link?(m) }
    end

    def self.link?(text)
      text =~ /link_to/
    end

    def self.last_identifier(text)
      text.gsub(/.+\./,'')
    end

    def self.link_label(text)
      text.match /(((?<=link_to\s\()|(?<=link_to\()).+(?=,))/
    end
  end
end
