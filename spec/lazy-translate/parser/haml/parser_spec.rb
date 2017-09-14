require 'spec_helper'

describe LazyTranslate::Haml::Parser do
  subject = LazyTranslate::Haml::Parser

  describe '#call' do
    let(:parser) { subject.new({}) }

    context 'produces ParseNodes with start\finish metadata' do
      it 'test1' do
        haml = <<~HAML
          #content
            .left.column
              Welcome to our site!
              %p= print_information
            .right.column
              = render :partial => "sidebar"
        HAML
        expect(parser.call(haml)).to contain_exactly(
          LazyTranslate::TextElement.new(content: "Welcome to our site!", start: 4, finish: 24, line: 2),
        )
      end
    end
  end
end
