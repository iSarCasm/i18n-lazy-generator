require 'spec_helper'

describe I18n::Lazy::Generator::ReplaceUnit do
  subject = I18n::Lazy::Generator::ReplaceUnit

  before do
    @replace_unit = subject.new(start: 1, finish: 2, data: "KABOOM!")
  end

  describe '#apply' do
    it 'replaces given part of string' do
      expect(@replace_unit.apply("12345")).to eq "1KABOOM!45"
    end

    it 'doesnt change initial string' do
      string = "12345"
      @replace_unit.apply("12345")
      expect(string).to eq "12345"
    end
  end
end
