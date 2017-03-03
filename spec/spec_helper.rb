$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'lazy-translate'

def check_matches(matches, proc)
  matches.each do |test, result|
    it "#{test} => #{result}" do
      expect(proc.call(test)).to eq result
    end
  end
end

def check_input_output_comment(tests, proc)
  tests.each do |test|
    it "works correctly with #{test[:comment]}" do
      expect(proc.call(*test[:input])).to eq(test[:output])
    end
  end
end

def open_file(path, options)
  copy_test_file(path)
  File.open("./tmp/#{path}", options)
end
require 'pry'
def copy_test_file(path)
  binding.pry
  copy = File.open("./env/#{path}", 'rb')
  File.open("./tmp/#{path}", 'w') { |wr_f| wr_f.write(copy.read) }
end
