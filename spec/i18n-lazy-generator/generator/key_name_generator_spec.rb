require 'spec_helper'

describe I18n::Lazy::Generator::KeyName do
  subject = I18n::Lazy::Generator::KeyName

  tests = [
    {
      input:    "it is rainy today",
      output:   "it_is_rainy_today",
      comment:  "just a simple line of text"
    },
    {
      input:    "it's 15% rainy today!",
      output:   "its_15_rainy_today",
      comment:  "text with some special chars"
    },
    {
      input:    "its 15 rainy today. I am so happy about it. Gonna tell all my friends this crap.",
      output:   "its_15_rainy_today_i",
      comment:  "long text (should cut to 5 first words)"
    },
    {
      input:    "hi bro",
      output:   "hi_bro",
      comment:  "very short text"
    },
    {
      input:    "Its <b>rainy</b> today",
      output:   "its_rainy_today_html",
      comment:  "text with html tags (should add _html to an end & no tags in key name)"
    },
    {
      input:    "Its <b>rainy</b> today",
      output:   "its_rainy_today_html",
      comment:  "text with html tags (should add _html to an end & no tags in key name)"
    },
    {
      input:    "<div class='col-md-1.5'>Its <b>rainy</b> today</div><em><br></em>",
      output:   "its_rainy_today_html",
      comment:  "text with html tags (should add _html to an end & no tags in key name)"
    },
    {
      input:    "<div><div>yo</em><alpachino alt='wtf'>",
      output:   "yo_html",
      comment:  "text with html tags (should add _html to an end & no tags in key name)"
    },
    {
      input:    "It is rainy <%= Time.now.day %>",
      output:   "it_is_rainy_day",
      comment:  "text with erb"
    },
    {
      input:    "It is rainy <%= link_to('today', 'today.com') %>",
      output:   "it_is_rainy_today_html",
      comment:  "text with erb link"
    }
  ]

  describe '.generate' do
    check_input_output_comment(tests, subject.method(:generate))
  end
end
