module I18n::Lazy::Generator
  class ParsedElement
    attr_reader :start, :end
    attr_accessor :content

    def initialize
      @content  = ""
      @finished = false
    end

    def can_add? char, index
      true
    end

    def add(char, index, transitions)
      @start    = index if @content.empty?
      @content  += char
      @end      = index if finished?
      new_self = nil
      transitions.each do |t|
        new_self ||= t.transition self
      end
      new_self || self
    end

    def to_s
      @content
    end

    def finish index
      @end      = index
      @finished = true
    end

    def finished?
      @finished
    end

    def self.transition parsed_element
      if self.transitionable? parsed_element then
        self.new(parsed_element)
      else
        nil
      end
    end

    def self.transitionable? parsed_element
      fail NotImplementedError, "ParsedElement .transitionable must be implemented"
    end
  end
end
