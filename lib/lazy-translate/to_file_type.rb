module LazyTranslate
  module ToFileType
    def self.from_path(path)
      path.split('.').last
    end
  end
end
