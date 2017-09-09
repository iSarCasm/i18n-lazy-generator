require 'spec_helper'

describe LazyTranslate::SourceUpdater do
  subject = LazyTranslate::SourceUpdater

  context '.update' do
    let(:test_1) { env_file 'test1.haml' }
    let(:result_1) { env_file 'result1.haml' }

    it 'returns correct updated source text for TEST1' do
      expect(subject.update(test_1)).to eq File.read(result_1)
    end
  end

  context '.update_source' do
    before do
      @source_1 = <<-HAML
#content
  .left.column
    %h2 Welcome to our site!
    %p= print_information
  .right.column
    = render :partial => "sidebar"
HAML
      @result_1 = <<-HAML
#content
  .left.column
    %h2 =t('.welcome_to_our_site')
    %p= print_information
  .right.column
    = render :partial => "sidebar"
HAML
    end

    it 'returns updated source text for HAML' do
      expect(subject.update_source(@source_1, :haml)).to eq @result_1
    end
  end
end
