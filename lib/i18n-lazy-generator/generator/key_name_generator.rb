module I18n::Lazy::Generator
  module KeyName
    def self.generate(content)
      # name = content.gsub(/%\S+/, "")
      # name = name.gsub("'", "").gsub("`", "")
      # name = name.split(' ').first(5).join(' ')
      key_name = content.downcase.gsub(/\W+/, '_')
      # key_name = content[0...content.size-1] if content[-1] == '_'
      # name << '_html' if contains_html?(content)
      key_name
    end

    # def self.contains_html?(text)
    #   text.split('').any? do |x|
    #     x == '%'
    #   end
    # end
  end
end
