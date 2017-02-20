require 'spec_helper'

describe I18n::Lazy::Generator::ConfigUpdater do
  subject = I18n::Lazy::Generator::ConfigUpdater

  before do
    @source = <<-HAML
#content
.left.column
  %h2 Welcome to our site!
  %p= print_information
.right.column
  = render :partial => "sidebar"
HAML
    @context  = "en/main_page"
    @yaml     = <<-YAML
en:
  some_key: some text
  main_page:
    some_stuff: some other suff
  other_page:
    other_stuff: some another stuff
YAML
  end

  describe '.run' do
    it 'creates a new scope and puts key-content pairs inside' do
      expect(subject.run(@source, :haml, @context, "")).to eq "---\nen:\n  main_page:\n    welcome_to_our_site: Welcome to our site!\n"

    end

    it 'adds to existing scope and puts a key-content pairs inside' do
      expect(subject.run(@source, :haml, @context, @yaml)).to eq "---\nen:\n  some_key: some text\n  main_page:\n    some_stuff: some other suff\n    welcome_to_our_site: Welcome to our site!\n  other_page:\n    other_stuff: some another stuff\n"
    end
  end
end
