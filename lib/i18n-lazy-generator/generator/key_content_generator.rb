module I18n::Lazy::Generator
  module KeyContent
      def self.generate(content)
        content
        # text = content.gsub( /[ \t]{2,}/, " " )
        # text = "\n" << text
        # text = text.gsub( /\n/, "\n\t" )
        # text = text.gsub "\t ", "\t"
        # puts text
        # text = "%p" << text
        # text = text.gsub(/=.+$/, "SOME_VAR")
        # puts text
        # text = Haml::Engine.new(text).render
        # text = text.gsub("SOME_VAR", "%{}")
        # text = text[6..-6]
        # text = text.gsub( / *\s+/, " " )
        # text = text[0...text.size-1] if text[-1] == ' '
      end
  end
end
