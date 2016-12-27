$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'i18n-lazy-generator'

def check_matches(matches, proc)
  matches.each do |test, result|
    it "#{test} => #{result}" do
      expect(proc.call(test)).to eq result
    end
  end
end
