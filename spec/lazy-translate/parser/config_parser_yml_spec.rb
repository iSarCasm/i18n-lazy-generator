require 'spec_helper'

describe LazyTranslate::ConfigParserYML do
  subject = LazyTranslate::ConfigParserYML

  describe '#parse' do
    before do
      @content = <<-YML
        en:
          some_key: some text
          main_page:
            some_stuff: some other stuff
          other_page:
            other_stuff: some another stuff
      YML
    end

    context 'converts YML file to hash' do
      it do
        expect(subject.new.parse(@content)).to eq({
          'en' => {
            'some_key' => 'some text',
            'main_page' => {
              'some_stuff' => 'some other stuff',
            },
            'other_page' => {
              'other_stuff' => 'some another stuff'
            }
          }
        })
      end

      it do
        expect(subject.new.parse('')).to eq({})
      end
    end
  end
end
