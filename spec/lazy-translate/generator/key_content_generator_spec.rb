require 'spec_helper'

describe LazyTranslate::KeyContentGenerator do
  subject = LazyTranslate::KeyContentGenerator

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
      comment:  "text with 1 variable name collision"
    },
    {
      input:    "it is rainy <%= Time.now.day %> or <%= Time.now.day %> or <%= Time.now.day %>. <%= alert %> <%= alert %>",
      output:   'it is rainy %{day} or %{day2} or %{day3}. %{alert} %{alert2}',
      comment:  "text with multple variable name collision"
    }
  ]

  describe '.generate' do
    check_input_output_comment(tests, subject.method(:generate))
  end
end
