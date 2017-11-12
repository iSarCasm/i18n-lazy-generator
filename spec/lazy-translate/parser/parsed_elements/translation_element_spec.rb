require 'spec_helper'

describe LazyTranslate::TranslationElement do
  subject = LazyTranslate::TranslationElement

  context '#apply' do
    let(:translation_element) { subject.new(original: 'Original', line: 1, start: 2, finish: 11) }
    let(:text) { "Hi there!\n%p Some Text field" }

    it 'returns text with applied translation' do
      translation_element.translation_key = "= t('new_translation')"
      expect(translation_element.apply_translation(text)).to eq "Hi there!\n%p= t('new_translation') field"
    end

    it 'raises error if translation not set' do
      expect{translation_element.apply_translation(text)}.to raise_error
    end

    it 'raises error if already been applied' do
      translation_element.translation_key = "= t('new_translation')"
      translation_element.apply_translation(text)
      expect{translation_element.apply_translation(text)}.to raise_error
    end
  end
end
