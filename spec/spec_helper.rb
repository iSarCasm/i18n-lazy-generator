$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'lazy-translate'
require 'pry'

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

def read_env_file(path, options = {})
  File.read env_file(path, options)
end

def env_file(path, options = {})
  copy_test_file(path)
  "#{File.dirname(__FILE__)}/tmp/#{path}"
end

def copy_test_file(path)
  copy = File.open("#{File.dirname(__FILE__)}/env/#{path}", 'rb')
  File.open("#{File.dirname(__FILE__)}/tmp/#{path}", 'w+') { |wr_f| wr_f.write(copy.read) }
end
