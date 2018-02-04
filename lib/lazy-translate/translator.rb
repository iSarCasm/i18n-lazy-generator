module LazyTranslate
  module Translator
    def self.translate(source_path: nil, config_path: nil, context_string: nil)
      source_content  = File.read(source_path)
      source_filetype = FileType.new source_path
      source_parser = source_filetype.source_parser.new
      new_translations = source_parser.parse source_content

      reader = source_filetype.reader
      new_translations.each do |translation|
        translation.translation_content = TextToKeyContent.convert(reader, translation.original)
        binding.pry
        translation.translation_key = TextToKeyName.convert(reader, translation.translation_content.content)
      end

      source_updater      = source_filetype.source_updater.new
      new_source_content  = source_updater.update source_content, new_translations

      config_content  = File.read(config_path)
      config_filetype = FileType.new config_path
      config_io   = config_filetype.config_io.new
      config_hash = config_io.parse config_content

      context = ContextBuilder.build(context_string)
      new_config_hash     = ConfigUpdater.update config_hash, new_translations, context
      new_config_content  = config_io.compose new_config_hash

      puts Diffy::Diff.new(source_content, new_source_content).to_s(:color)
      puts 'Want to save the changes? (y/n)'
      confirmed_changes = $stdin.gets.chomp.downcase == 'y'
      File.open(source_path, 'w') { |f| f.write(new_source_content) } if confirmed_changes
      File.open(config_path, 'w') { |f| f.write(new_config_content) } if confirmed_changes
    end
  end
end
