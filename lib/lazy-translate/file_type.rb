module LazyTranslate
  class FileType
    attr_reader :type

    def initialize(path)
      @type = path.split('.').last
    end

    def source_parser
      LazyTranslate.const_get('SourceParser'+type.to_s.upcase, true)
    end

    def config_parser
      LazyTranslate.const_get('ConfigParser'+type.to_s.upcase, true)
    end

    def source_updater
      LazyTranslate.const_get('SourceUpdater'+type.to_s.upcase, true)
    end

    def config_updater
      LazyTranslate.const_get('ConfigUpdater'+type.to_s.upcase, true)
    end

    private

    def get_parser

    end
  end
end
