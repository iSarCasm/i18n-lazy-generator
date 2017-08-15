require 'spec_helper'

describe LazyTranslate::SourceUpdater do
  subject = LazyTranslate::SourceUpdater

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

    it 'returns updated source text' do
      expect(subject.update_source(@source_1, :haml)).to eq @result_1
    end
  end
end
