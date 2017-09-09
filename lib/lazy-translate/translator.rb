module LazyTranslate
  module Translator
    def self.translate(source_path: nil, config_path: nil, context: nil)
      read_source   = File.read(source_path)
      source_format = path.split('.').last
      new_source    = SourceUpdater.update(source_path, source_format)
      # ConfigUpdater.update(source_path: source_path, config_path: config_path, context: context)
      puts Diffy::Diff.new(read_source, new_source).to_s(:color)
      puts 'Want to save the changes? (y/n)'
      File.open(source_path, 'w') { |f| f.write(new_source) } if $stdin.gets.chomp.downcase == 'y'
    end
  end
end
