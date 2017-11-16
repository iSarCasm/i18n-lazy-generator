module LazyTranslate
  module ConfigUpdater
    def self.update(config_hash, new_translations, context)
      new_translations.each do |t|
        path = context.dup << t.translation_key
        hash_deep_store(config_hash, path, t.translation)
      end
      config_hash
    end

    def self.hash_deep_store(hash, array, value)
      value = value.clone
      array.reverse.each do |layer|
        value = { layer => value.clone }
      end
      hash.deep_merge!(value)
    end
  end
end
