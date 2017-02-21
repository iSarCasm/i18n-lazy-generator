require 'spec_helper'

describe LazyTranslate::YAML do
  subject { LazyTranslate::YAML }

  describe '.embedded_variable' do
    it 'wraps name into YAML embedded_variable' do
      expect(subject.embedded_variable("text")).to eq '%{text}'
    end
  end
end
