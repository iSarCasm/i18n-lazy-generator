require 'spec_helper'

describe LazyTranslate::YAML do
  subject { LazyTranslate::YAML }

  describe '.variable' do
    it 'wraps name into YAML variable' do
      expect(subject.variable("text")).to eq '%{text}'
    end
  end
end
