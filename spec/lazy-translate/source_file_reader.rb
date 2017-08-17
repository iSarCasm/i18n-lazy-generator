require 'spec_helper'

describe LazyTranslate::SourceFileReader do
  describe '.substitute_vars_in_text' do
    it 'raises NotImplementedError' do
      expect{LazyTranslate::SourceFileReader.substitute_vars_in_text('')}.to raise_error(NotImplementedError)
    end
  end

  describe '.extract_var' do
    it 'raises NotImplementedError' do
      expect{LazyTranslate::SourceFileReader.extract_var('')}.to raise_error(NotImplementedError)
    end
  end
end
