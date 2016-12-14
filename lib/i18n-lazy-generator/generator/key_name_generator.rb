module I18n::Lazy::Generator
  module KeyName
    def self.generate(content)
      contains_html = contains_html?(content)
      key_name = content.downcase           # downcase
      key_name = remove_html(key_name)
      key_name.gsub!(/\s+/, '_')            # substitute spaces
      key_name.gsub!(/\W+/,'')              # remove special chars
      key_name = key_name.split('_').first(5).join('_') # leave only 5 first words
      key_name += '_html' if contains_html
      key_name
    end

    def self.contains_html?(text)
      text =~ /<.+?>/
    end

    def self.remove_html(text)
      text.gsub(/<.+?>/,'')
    end
  end
end
