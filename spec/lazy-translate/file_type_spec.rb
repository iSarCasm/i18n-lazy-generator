require 'spec_helper'

describe LazyTranslate::FileType do
  subject = LazyTranslate::FileType

  describe '#type' do
    describe 'returns file type as a String' do
      it do
        expect(subject.new('file.rb').type).to eq 'rb'
      end

      it do
        expect(subject.new('file.yml').type).to eq 'yml'
      end

      it do
        expect(subject.new('file.haml').type).to eq 'haml'
      end

      it do
        expect(subject.new('file.html.haml').type).to eq 'haml'
      end

      it do
        expect(subject.new('/some/.stuff/file.html.haml').type).to eq 'haml'
      end
    end
  end

  describe '#source_parser' do
    it do
      expect(subject.new('file.haml').source_parser).to eq LazyTranslate::SourceParserHAML
    end
  end

  describe '#config_parser' do
    it do
      expect(subject.new('file.yml').config_parser).to eq LazyTranslate::ConfigParserYML
    end
  end

  describe '#source_updater' do
    it do
      expect(subject.new('file.haml').source_updater).to eq LazyTranslate::SourceUpdaterHAML
    end
  end

  describe '#config_updater' do
    it do
      expect(subject.new('file.yml').config_updater).to eq LazyTranslate::ConfigUpdaterYML
    end
  end
end
