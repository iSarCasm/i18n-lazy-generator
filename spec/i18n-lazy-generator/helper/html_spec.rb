require 'spec_helper'

describe I18n::Lazy::Generator::HTML do
  subject = I18n::Lazy::Generator::HTML

  describe '.contains_html?' do
    matches = {
      "<b>yes</b>"                      => true,
      "yes<br>bro"                      => true,
      "<div><iframe></iframe><div>"     => true,
      "<angular-tag>rofl</angular-tag>" => true,
      ""                                => false,
      "no"                              => false,
      "pure text <3"                    => false,
      "<% kek %>"                       => false,
      "<%=text%>"                       => false
    }

    check_matches(matches, subject.method(:contains_html?))
  end

  describe '.remove_html' do
    matches = {
      "<b>yes</b>"                      => "yes",
      "yes<br>bro"                      => "yesbro",
      "<div><iframe></iframe><div>"     => "",
      "<angular-tag>rofl</angular-tag>" => "rofl",
      "no"                              => "no",
      "pure text <3"                    => "pure text <3",
      "<% kek %>"                       => "<% kek %>",
      "<%=text%>"                       => "<%=text%>"
    }

    check_matches(matches, subject.method(:remove_html))
  end
end
