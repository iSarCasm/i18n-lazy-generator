require 'spec_helper'

describe LazyTranslate::YAML do
  subject { LazyTranslate::YAML }

  describe '.formatted_variable' do
    it 'wraps name into YAML embedded_variable' do
      expect(subject.formatted_variable("text")).to eq '%{text}'
    end
  end
end
