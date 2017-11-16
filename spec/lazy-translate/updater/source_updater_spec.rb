require 'spec_helper'

describe LazyTranslate::SourceUpdater do
  subject = LazyTranslate::SourceUpdater

  describe '.update' do
    before do
      @source = <<~HAML
        #content
        .left.column
          %h2 Welcome to our site!
          %p Hello world!
          %p= print_information
        .right.column
          = image_tag('icon.png', alt: 'alternative text')
      HAML
      @new_translations = [
        LazyTranslate::TranslationElement.new(translation_key: 'welcome', location: :text, line: 2, start: 5, finish: 26),
        LazyTranslate::TranslationElement.new(translation_key: 'hello_world', location: :text, line: 3, start: 4, finish: 17),
        LazyTranslate::TranslationElement.new(translation_key: 'alternative_text', location: :ruby, line: 6, start: 31, finish: 49)
      ]
      @result = <<~HAML
        #content
        .left.column
          %h2welcome
          %phello_world
          %p= print_information
        .right.column
          = image_tag('icon.png', alt: alternative_text)
      HAML
    end

    it 'updates file as expected' do
      expect(subject.new.update(@source, @new_translations)).to eq @result
    end
  end
end
