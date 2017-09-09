module LazyTranslate
  module Translator
    def self.translate(source_path: nil, config_path: nil, context: nil)
      new_source = SourceUpdater.update(source_path)
      puts new_source
      # ConfigUpdater.update(source_path: source_path, config_path: config_path, context: context)
    end
  end
end
