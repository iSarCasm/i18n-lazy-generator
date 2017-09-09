require 'spec_helper'

describe LazyTranslate::SourceUpdater do
  subject = LazyTranslate::SourceUpdater

  context '.update' do
    let(:test_1) { read_env_file('test1.haml') }
    let(:result_1) { read_env_file('result1.haml') }

    it 'returns correct updated source text for TEST1' do
      expect(subject.update(test_1, :haml)).to eq result_1
    end
  end
end
