require 'pry'

module I18n::Lazy::Generator
  module KeyName
    def self.generate(content)
      should_add_html = contains_html?(content) || contains_erb_link?(content)
      key_name = content.downcase           # downcase
      key_name = interpolate(key_name)
      key_name = remove_html(key_name)
      key_name.gsub!(/\s+/, '_')            # substitute spaces
      key_name.gsub!(/\W+/,'')              # remove special chars
      key_name = key_name.split('_').first(5).join('_') # leave only 5 first words
      key_name += '_html' if should_add_html
      key_name
    end

    def self.contains_html?(text)
      text =~ /<(?!%).+?>/
    end


    def self.contains_erb_link?(text)
      text.match(/(<%=.+?>)/).to_a.any? do |m|
        is_erb_link?(m)
      end
    end

    def self.is_erb_link?(erb)
      erb =~ /link_to/
    end

    def self.interpolate(text)
      text.gsub(/(<%=.+?>)/) do
        "#{erb_to_key_part($1)}"
      end
    end

    def self.erb_to_key_part(erb)
      if is_erb_link?(erb)
        erb =~ /(((?<=link_to\s\()|(?<=link_to\()).+(?=,))/
        $1
      else
        erb.gsub(/\W/,'')
        erb.gsub(/.+\./,'')
      end
    end

    def self.remove_html(text)
      text.gsub(/<(?!%).+?>/,'')
    end
  end
end
