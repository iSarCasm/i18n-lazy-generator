module LazyTranslate
  module Translator
    def self.translate(source_path: nil, config_path: nil, context: nil)
      source_content  = File.read(source_path)
      source_format   = ToFileType.from_path(source_path)

      config_content  = File.read(config_path)
      config_format   = ToFileType.from_path(config_path)

      new_translations = SourceParser.parse(source_content, source_format)
      config_hash      = ConfigParser.parse(config_content, config_format-)

      new_source = SourceWriter.update(source_content, source_format)
      new_config = ConfigUpdater.update({}, config_content, config_format)

      puts Diffy::Diff.new(read_source, new_source).to_s(:color)
      puts 'Want to save the changes? (y/n)'
      confirmed_changes = $stdin.gets.chomp.downcase == 'y'
      File.open(source_path, 'w') { |f| f.write(new_source) } if confirmed_changes
      File.open(config_path, 'w') { |f| f.write(new_source) } if confirmed_changes
    end
  end
end
