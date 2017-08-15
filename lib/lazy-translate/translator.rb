module LazyTranslate
  module Translator
    def self.translate(source_file: nil, config_file: nil, context: nil)
      SourceUpdater.update(source_file)
      ConfigUpdater.update(source_path: source_file, config_file: config_file, context: context)
    end
  end
end
