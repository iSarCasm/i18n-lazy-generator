module I18n::Lazy::Generator
  class ReplaceUnit
    def initialize(start: 0, finish: 0, data: "")
      throw "finish is less than start" if finish < start
      @start  = start
      @finish = finish
      @data   = data
    end

    def apply(string)
      throw "string is too small" if string.length < @finish
      string[@start..@finish] = @data
      string
    end
  end
end
