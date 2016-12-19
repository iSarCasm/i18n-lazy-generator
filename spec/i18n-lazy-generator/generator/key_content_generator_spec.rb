require 'spec_helper'

describe I18n::Lazy::Generator::KeyContent do
  subject { I18n::Lazy::Generator::KeyContent }

  tests = [
    {
      input:    "it is rainy today",
      output:   'it is rainy today',
      comment:  "just a simple line of text"
    },
    {
      input:    "it is <strong>rainy</strong> today<br> wow.",
      output:   'it is <strong>rainy</strong> today<br> wow.',
      comment:  "text with html tags"
    },
    {
      input:    "it is rainy <%= Time.now.day %>.",
      output:   'it is rainy %{day}.',
      comment:  "text with erb tags"
    },
    {
      input:    "It is rainy <%= link_to('today', 'today.com') %>.",
      output:   'It is rainy %{link}.',
      comment:  "text with erb link"
    },
    {
      input:    "It is rainy <%= link_to('today', 'today.com') %> (go <%= link_to('check', 'google.com/weather') %>)",
      output:   'It is rainy %{link} (go %{link2})',
      comment:  "text with multiple erb links"
    },
    {
      input:    "it is rainy <%= Time.now.day %> or <%= Time.now.day %>.",
      output:   'it is rainy %{day} or %{day2}.',
      comment:  "text with variable names collision"
    },
  ]

  describe '.generate' do
    tests.each do |test|
      it "works correctly with #{test[:comment]}" do
        expect(subject.generate(test[:input])).to eq(test[:output])
      end
    end
  end
end
