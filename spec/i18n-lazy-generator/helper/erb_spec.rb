require 'spec_helper'

describe I18n::Lazy::Generator::ERB do
  subject { I18n::Lazy::Generator::ERB }

  describe '.map' do
    it 'enumerates on each erb tag' do
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

  describe '.contains_link?' do
    context 'returns whether string contains erb links' do
      matches = {
        "Simple text" => false,
        '<a href="http://google.com">link</a>'  => false,
        '<%=link_to("rofl", "google.com")%>'    => true,
        '<%= link_to(rofl, "malware.soft") %>'  => true,
      }

      matches.each do |text, result|
        it text do
          expect(subject.contains_link?(text)).to eq result
        end
      end
    end
  end

  describe '.link?' do
    context 'shows whether string contains a link or not' do
      matches = {
        "<%= link_to 'rofl', 'google.com'%>"  => true,
        "link to simple text"                 => false
      }

      matches.each do |text, result|
        it text do
          expect(subject.link?(text)).to eq result
        end
      end
    end
  end

  describe '.last_identifier' do
    context 'returns last indentifier inside ERB' do
      matches = {
        'func(x)'           => 'func',
        'first.last'        => 'last',
        'first.second.last' => 'last',
        'fist.last x'       => 'last',
        'simple'            => 'simple',
        'func x'            => 'func'
      }

      matches.each do |text, result|
        it text do
          expect(subject.last_identifier(text)).to eq result
        end
      end
    end
  end
end
