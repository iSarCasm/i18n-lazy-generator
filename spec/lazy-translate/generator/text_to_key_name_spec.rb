require 'spec_helper'

describe LazyTranslate::TextToKeyName do
  subject = LazyTranslate::TextToKeyName

  tests = [
    {
      input:    [LazyTranslate::ReaderERB, "it is rainy today"],
      output:   'it_is_rainy_today',
      comment:  "just a simple line of text"
    },
    {
      input:    [LazyTranslate::ReaderERB, "it's 15% rainy today!"],
      output:   'its_15_rainy_today',
      comment:  "text with some special chars"
    },
    {
      input:    [LazyTranslate::ReaderERB, "its 15 rainy today. I am so happy about it. Gonna tell all my friends this crap."],
      output:   'its_15_rainy_today_i',
      comment:  "long text (should cut to 5 first words)"
    },
    {
      input:    [LazyTranslate::ReaderERB, "hi bro"],
      output:   'hi_bro',
      comment:  "very short text"
    },
    {
      input:    [LazyTranslate::ReaderERB, "Its <b>rainy</b> today"],
      output:   'its_rainy_today_html',
      comment:  "text with html tags (should add _html to an end & no tags in key name)"
    },
    {
      input:    [LazyTranslate::ReaderERB, "Its <b>rainy</b> today"],
      output:   'its_rainy_today_html',
      comment:  "text with html tags (should add _html to an end & no tags in key name)"
    },
    {
      input:    [LazyTranslate::ReaderERB, "<div class='col-md-1.5'>Its <b>rainy</b> today</div><em><br></em>"],
      output:   'its_rainy_today_html',
      comment:  "text with html tags (should add _html to an end & no tags in key name)"
    },
    {
      input:    [LazyTranslate::ReaderERB, "<div><div>yo</em><alpachino alt='wtf'>"],
      output:   'yo_html',
      comment:  "text with html tags (should add _html to an end & no tags in key name)"
    },
    {
      input:    [LazyTranslate::ReaderERB, "It is rainy <%= Time.now.day %>"],
      output:   'it_is_rainy_day',
      comment:  "text with erb"
    },
    {
      input:    [LazyTranslate::ReaderERB, "It is rainy <%= link_to('today', 'today.com') %>"],
      output:   'it_is_rainy_today_html',
      comment:  "text with erb link"
    }
  ]

  describe '.convert' do
    check_input_output_comment(tests, subject.method(:convert))
  end
end
