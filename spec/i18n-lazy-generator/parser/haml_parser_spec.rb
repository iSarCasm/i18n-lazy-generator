require 'spec_helper'

describe I18n::Lazy::Generator::HAMLParser do
  subject = I18n::Lazy::Generator::HAMLParser

  before do
    @haml_1 = <<-HAML
#content
  .left.column
    %h2 Welcome to our site!
    %p= print_information
  .right.column
    = render :partial => "sidebar"
    HAML
  end

  describe '.parse' do
    context 'returns Array of Elements' do
      it do
        expect(subject.parse(@haml_1).map{|x| x.content}).to eq [
          "#content\n",
          "  ",
          ".left.column\n",
          "    ",
          "%h2", " ",
          "Welcome to our site!",
          "\n    ",
          "%p", "= print_information",
          "\n  ",
          ".right.column\n",
          "    ",
          "= render :partial => \"sidebar\"",
          "\n"
        ]
      end
    end
  end

  describe '.parse_and_finalize' do
    context 'returns Array of Elements' do
      it do
        expect(subject.parse_and_finalize(@haml_1).map{|x| x.content}).to eq [
          "#content\n",
          "  ",
          ".left.column\n",
          "    ",
          "%h2", " ",
          "Welcome to our site!",
          "\n    ",
          "%p", "= print_information",
          "\n  ",
          ".right.column\n",
          "    ",
          "= render :partial => \"sidebar\"",
          "\n"
        ]
      end
    end
  end
end
