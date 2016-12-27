require 'spec_helper'

describe I18n::Lazy::Generator::YAML do
  subject { I18n::Lazy::Generator::YAML }

  describe '.variable' do
    it 'wraps name into YAML variable' do
      expect(subject.variable("text")).to eq '%{text}'
    end
  end
end
