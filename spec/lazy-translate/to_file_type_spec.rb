require 'spec_helper'

describe LazyTranslate::ToFileType do
  describe '#from_path' do
    describe 'returns file type as a String' do
      it { expect(LazyTranslate::ToFileType.from_path('file.rb')).to eq 'rb' }
      it { expect(LazyTranslate::ToFileType.from_path('file.yml')).to eq 'yml' }
      it { expect(LazyTranslate::ToFileType.from_path('file.haml')).to eq 'haml' }
      it { expect(LazyTranslate::ToFileType.from_path('file.html.haml')).to eq 'haml' }
      it { expect(LazyTranslate::ToFileType.from_path('/some/.stuff/file.html.haml')).to eq 'haml' }
    end
  end
end
