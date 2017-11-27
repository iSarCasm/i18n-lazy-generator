module LazyTranslate
  class FileType
    attr_reader :type

    def initialize(path)
      @type = path.split('.').last
    end

    def source_parser
      get_class('SourceParser', type)
    end

    def config_io
      get_class('ConfigIO_', type)
    end

    def source_updater
      get_class('SourceUpdater', type)
    end

    def reader
      get_class('Reader', type)
    end

    private

    def get_class(base, postfix)
      LazyTranslate.const_get(base+postfix.to_s.upcase, true)
    end
  end
end
