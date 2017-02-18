module I18n::Lazy::Generator
  class ReplaceUnit
    attr_reader :data

    def initialize(start: 0, finish: 0, data: "")
      throw "finish is less than start" if finish < start
      @start  = start
      @finish = finish
      @data   = data
    end

    def apply(string)
      string[0...@start] + @data + string[@finish+1..-1]
    end
  end
end
