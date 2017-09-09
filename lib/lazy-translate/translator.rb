module LazyTranslate
  module Translator
    def self.translate(source_path: nil, config_path: nil, context: nil)
      read_source = File.read(source_path)
      new_source = SourceUpdater.update(source_path)
      puts Diffy::Diff.new(read_source, new_source).to_s(:color)
      # ConfigUpdater.update(source_path: source_path, config_path: config_path, context: context)
    end
  end
end
