require 'spec_helper'

describe I18n::Lazy::Generator::ERB do
  subject { I18n::Lazy::Generator::ERB }

  describe '.map' do
    it 'reverse' do
      expect(subject.map("Hello <%= there %>") do |content|
        content.reverse
      end).to eq "Hello #{'<%= there %>'.reverse}"
    end
  end

  describe '.escape' do
    it 'removes ERB tags in start and end' do
      expect(subject.escape("<%= lel %>")). to eq "lel"
    end
  end
end
