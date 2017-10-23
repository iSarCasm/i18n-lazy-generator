module LazyTranslate
  module Translator
    def self.translate(source_path: nil, config_path: nil, context: nil)
      source_content  = File.read(source_path)
      source_filetype = FileType.new source_path
      source_parser = source_filetype.source_parser
      new_translations = source_parser.parse source_content

      config_content  = File.read(config_path)
      config_filetype = FileType.new config_path
      config_parser = config_filetype.config_parser
      config_hash   = config_parser.parse config_content

      source_updater      = source_filetype.source_updater
      new_source_content  = source_updater.update source_content, new_translations

      config_updater      = config_filetype.config_updater
      new_config_content  = config_updater.update config_hash, new_translations

      puts Diffy::Diff.new(source_content, new_source).to_s(:color)
      puts 'Want to save the changes? (y/n)'
      confirmed_changes = $stdin.gets.chomp.downcase == 'y'
      File.open(source_path, 'w') { |f| f.write(new_source) } if confirmed_changes
      File.open(config_path, 'w') { |f| f.write(new_source) } if confirmed_changes
    end
  end
end
