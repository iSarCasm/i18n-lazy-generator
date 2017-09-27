require 'spec_helper'

describe ToFileType do
  describe '#from_path' do
    describe 'returns file type as a String' do
      it { expect(ToFileType.from_path('file.rb')).to eq 'rb' }
      it { expect(ToFileType.from_path('file.yml')).to eq 'yml' }
      it { expect(ToFileType.from_path('file.haml')).to eq 'haml' }
      it { expect(ToFileType.from_path('file.html.haml')).to eq 'haml' }
      it { expect(ToFileType.from_path('/some/.stuff/file.html.haml')).to eq 'haml' }
    end
  end
end
