module I18n::Lazy::Generator
  module ERB
    def self.link?(text)
      text =~ /link_to/
    end
  end
end
