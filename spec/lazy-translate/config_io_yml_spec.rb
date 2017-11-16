require 'spec_helper'

describe LazyTranslate::ConfigIO_YML do
  subject = LazyTranslate::ConfigIO_YML

  describe '#parse' do
    context 'converts YML file to hash' do
      it do
        expect(subject.new.parse(
          <<~YML
            en:
              some_key: some text
              main_page:
                some_stuff: some other stuff
              other_page:
                other_stuff: some another stuff
          YML
        )).to eq({
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

  describe '#compose' do
    context 'converts a hash to YML file' do
      it do
        expect(subject.new.compose(
        'en' => {
          'some_key' => 'some text',
          'main_page' => {
            'some_stuff' => 'some other stuff',
          },
          'other_page' => {
            'other_stuff' => 'some another stuff'
          }
        }
        )).to eq(
          <<~YML
            en:
              some_key: some text
              main_page:
                some_stuff: some other stuff
              other_page:
                other_stuff: some another stuff
          YML
        )
      end
    end
  end
end
