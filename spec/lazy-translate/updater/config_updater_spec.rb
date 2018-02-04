require 'spec_helper'

describe LazyTranslate::ConfigUpdater do
  subject = LazyTranslate::ConfigUpdater

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
      @config_hash = {
        'en' => {
          'some_key' => 'Some key!',
          'some_other' => {
            'one' => 'One',
            'two' => 'Two'
          }
        }
      }
      @new_translations = [
        LazyTranslate::TranslationElement.new(
          translation_content: 'a new translation',
          translation_key: 'a_new_translation',
          line: nil,
          start: nil,
          finish: nil
        ),
        LazyTranslate::TranslationElement.new(
          translation_content: 'some text',
          translation_key: 'some_text',
          line: nil,
          start: nil,
          finish: nil
        ),
        LazyTranslate::TranslationElement.new(
          translation_content: 'something else',
          translation_key: 'something_else',
          line: nil,
          start: nil, 
          finish: nil
          )
      ]
      @context = ['en', 'some_other']
      @result = {
        'en' => {
          'some_key' => 'Some key!',
          'some_other' => {
            'one' => 'One',
            'two' => 'Two',
            'a_new_translation' => 'a new translation',
            'some_text' => 'some text',
            'something_else' => 'something else'
          }
        }
      }
    end

    it 'updates file as expected' do
      expect(subject.update(@config_hash, @new_translations, @context)).to eq @result
    end
  end
end
