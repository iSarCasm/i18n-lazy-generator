require 'spec_helper'

describe LazyTranslate::SourceUpdaterHAML do
  subject = LazyTranslate::SourceUpdaterHAML

  before do
    @source = <<-HAML
#content
.left.column
  %h2 Welcome to our site!
  %p= print_information
.right.column
  = render :partial => "sidebar"
HAML
    @context  = "en/main_page"
    @yaml     = <<-YAML
en:
  some_key: some text
  main_page:
    some_stuff: some other suff
  other_page:
    other_stuff: some another stuff
YAML
  end

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
        LazyTranslate::TranslationElement.new(translation_key: "= t('.welcome')", line: 2, start: 5, finish: 26),
        LazyTranslate::TranslationElement.new(translation_key: "= t('.hello_world')", line: 3, start: 4, finish: 17),
        LazyTranslate::TranslationElement.new(translation_key: "t('.alternative_text')", line: 6, start: 31, finish: 49)
      ]
      @result = <<~HAML
        #content
        .left.column
          %h2= t('.welcome')
          %p= t('.hello_world')
          %p= print_information
        .right.column
          = image_tag('icon.png', alt: t('.alternative_text'))
      HAML
    end

    it 'updates file as expected' do
      expect(subject.update(@source, @new_translations)).to eq @result
    end
  end
end
