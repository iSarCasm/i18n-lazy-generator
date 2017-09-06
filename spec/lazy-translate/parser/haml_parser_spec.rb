require 'spec_helper'

describe LazyTranslate::HAMLParser do
  subject = LazyTranslate::HAMLParser

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
    context 'returns Array of TextElements' do
      it do
        expect(subject.parse(@haml_1).map{|x| x.content}).to contain_exactly(
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
        )
      end
    end
  end

  describe '.parse_and_finalize' do
    context 'returns Array of Elements' do
      it do
        expect(subject.parse_and_finalize(@haml_1)).to contain_exactly(
          LazyTranslate::TextElement.new(content: "Welcome to our site!", start: 32, finish: 51),
        )
      end
    end
  end
end
