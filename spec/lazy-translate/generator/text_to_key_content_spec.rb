require 'spec_helper'

describe LazyTranslate::TextToKeyContent do
  subject = LazyTranslate::TextToKeyContent

  tests = [
    {
      input:    [LazyTranslate::ReaderERB, "it is rainy today"],
      output:   LazyTranslate::KeyContent.new('it is rainy today'),
      comment:  "just a simple line of text"
    },
    {
      input:    [LazyTranslate::ReaderERB, "it is <strong>rainy</strong> today<br> wow."],
      output:   LazyTranslate::KeyContent.new('it is <strong>rainy</strong> today<br> wow.'),
      comment:  "text with html tags"
    },
    {
      input:    [LazyTranslate::ReaderERB, "it is rainy <%= Time.now.day %>."],
      output:   LazyTranslate::KeyContent.new('it is rainy %{day}.', {'day' => 'Time.now.day'}),
      comment:  "text with erb tags"
    },
    {
      input:    [LazyTranslate::ReaderERB, "It is rainy <%= link_to('today', 'today.com') %>."],
      output:   LazyTranslate::KeyContent.new('It is rainy %{link}.', {'link' => "link_to('today', 'today.com')"}),
      comment:  "text with erb link"
    },
    {
      input:    [LazyTranslate::ReaderERB, "It is rainy <%= link_to('today', 'today.com') %> (go <%= link_to('check', 'google.com/weather') %>)"],
      output:   LazyTranslate::KeyContent.new(
                  'It is rainy %{link} (go %{link2})',
                  {'link' => "link_to('today', 'today.com')", 'link2' => "link_to('check', 'google.com/weather')"}
                ),
      comment:  "text with multiple erb links"
    },
    {
      input:    [LazyTranslate::ReaderERB, "it is rainy <%= Time.now.day %> or <%= Time.now.day %>."],
      output:   LazyTranslate::KeyContent.new(
                  'it is rainy %{day} or %{day2}.',
                  {'day' => 'Time.now.day', 'day2' => 'Time.now.day'}
                ),
      comment:  "text with 1 variable name collision"
    },
    {
      input:    [LazyTranslate::ReaderERB, "it is rainy <%= Time.now.day %> or <%= Time.now.day %> or <%= Time.now.day %>. <%= alert %> <%= alert %>"],
      output:   LazyTranslate::KeyContent.new(
                  'it is rainy %{day} or %{day2} or %{day3}. %{alert} %{alert2}',
                  {
                    'day' => 'Time.now.day',
                    'day2' => 'Time.now.day',
                    'day3' => 'Time.now.day',
                    'alert' => 'alert',
                    'alert2' => 'alert'
                  }
                ),
      comment:  "text with multple variable name collision"
    }
  ]

  describe '.convert' do
    check_input_output_comment(tests, subject.method(:convert))
  end
end
