require 'spec_helper'

describe LazyTranslate::SourceParserHAML do
  subject = LazyTranslate::SourceParserHAML

  describe '#parse' do
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

    it 'converts HAML file to TranslationElements' do
      expect(subject.new.parse(@haml_1)).to contain_exactly(
        LazyTranslate::TextElement.new(content: "Welcome to our site!", start: 32, finish: 51),
      )
    end
  end
end
