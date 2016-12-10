require 'spec_helper'

describe I18n::Lazy::Generator::KeyName do
  subject { I18n::Lazy::Generator::KeyName }

  tests = [
    {
      input:    "it is rainy today",
      output:   "it_is_rainy_today",
      comment:  "just a simple line of text"
    },
    {
      input:    "it's 15% rainy today!",
      output:   "it_is_rainy_today",
      comment:  "text with some special chars"
    }
  ]

  describe '.generate' do
    tests.each do |test|
      it "generates name correctly from #{test[:comment]}" do
        expect(subject.generate(test[:input])).to eq(test[:output])
      end
    end
  end
end
