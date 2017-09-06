require 'spec_helper'

describe LazyTranslate::TranslationElement do
  subject = LazyTranslate::TranslationElement

  context '#apply' do
    let(:translation_element) { subject.new(translation: 'TRANSLATED', start: 3, finish: 11) }
    let(:text) { "%p Some Text field" }

    it 'returns text with applied translation' do
      expect(translation_element.apply_translation(text)).to eq '%p TRANSLATED field'
    end

    it 'doesnt apply translation if already been applied' do
      new_text = translation_element.apply_translation(text)
      expect(translation_element.apply_translation(new_text)).to eq new_text
    end
  end
end
