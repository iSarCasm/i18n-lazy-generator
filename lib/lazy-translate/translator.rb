module LazyTranslate
  module Translator
    def self.translate(source_path: nil, config_path: nil, context: nil)
      SourceUpdater.update(source_path)
      # ConfigUpdater.update(source_path: source_path, config_path: config_path, context: context)
    end
  end
end
