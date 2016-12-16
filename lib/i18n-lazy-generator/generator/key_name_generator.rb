module I18n::Lazy::Generator
  module KeyName
    def self.generate(content)
      should_add_html = contains_html?(content) || contains_erb_link?(content)
      key_name = interpolate(content)
      key_name = remove_html(key_name)
      key_name = to_snake_case(key_name)
      key_name = restrict_word_count(text: key_name, words: 5)
      key_name += '_html' if should_add_html
      key_name
    end

    def self.contains_html?(text)
      text =~ /<(?!%).+?>/
    end

    def self.contains_erb_link?(text)
      text.match(/(<%=.+?>)/).to_a.any? { |m| I18n::Lazy::Generator::ERB.link?(m) }
    end

    def self.interpolate(text)
      text.gsub(/(<%=.+?>)/) { erb_to_key($1) }
    end

    def self.remove_html(text)
      text.gsub(/<(?!%).+?>/,'')
    end

    def self.to_snake_case(text)
      text.downcase.gsub(/\s+/, '_').gsub(/\W+/,'')
    end

    def self.restrict_word_count(text: nil, words: 5)
      text.split('_').first(words).join('_')
    end

    private

    def self.erb_to_key(erb)
      if I18n::Lazy::Generator::ERB.link?(erb)
        erb.match /(((?<=link_to\s\()|(?<=link_to\()).+(?=,))/
      else
        erb.gsub(/.+\./,'')
      end
    end
  end
end
