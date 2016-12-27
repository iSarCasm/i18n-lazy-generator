module I18n::Lazy::Generator
  module HTML
    def self.contains_html?(text)
      !!(text =~ /<(?!%).+?>/)
    end

    def self.remove_html(text)
      text.gsub(/<(?!%).+?>/,'')
    end
  end
end
