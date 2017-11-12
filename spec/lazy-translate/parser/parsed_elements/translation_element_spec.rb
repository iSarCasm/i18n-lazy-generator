require 'spec_helper'

describe LazyTranslate::TranslationElement do
  subject = LazyTranslate::TranslationElement

  context '#apply' do
    let(:translation_element) { subject.new(original: 'Original', start: 3, finish: 11) }
    let(:text) { "%p Some Text field" }

    it 'returns text with applied translation' do
      translation_element.translate_with 'Translated'
      expect(translation_element.apply_translation(text)).to eq '%p Translated field'
    end

    it 'raises error if translation not set' do
      expect{translation_element.apply_translation(text)}.to raise_error
    end

    it 'raises error if already been applied' do
      translation_element.translate_with 'Translated'
      translation_element.apply_translation(text)
      expect{translation_element.apply_translation(text)}.to raise_error
    end
  end
end
