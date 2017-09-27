require 'spec_helper'

describe LazyTranslate::YamlConfigWriter do
  describe '#write' do
    describe 'returns updated text of an empty config' do
      let (:empty_config) { File.open(env_file('empty.yml')).read }

      it do
        hash = {
          'some_key' => 'Some Key!',
          'some_more' => {
            'some_key' => 'Another key!'
          }
        }
        result = File.open(env_file('res1.yml')).read
        expect(LazyTranslate::YamlConfigWriter.new(empty_config).write_keys(hash)).to eq result
      end

      it do
        hash = {
          'some_key' => '%{var} Some Key!',
          'some_more' => {
            'some_key' => '"Text"'
          }
        }
        result = File.open(env_file('res2.yml')).read
        expect(LazyTranslate::YamlConfigWriter.new(empty_config).write_keys(hash)).to eq result
      end
    end

    describe 'appends new keys to existing config text' do
      let (:non_empty) { File.open(env_file('non_empty.yml')).read }

      it do
        hash = {
          'some_more' => {
            'some_key' => 'Another key!'
          },
          'some_one' => {
            'some_key' => 'Another key!'
          }
        }
        result = File.open(env_file('res3.yml')).read
        expect(LazyTranslate::YamlConfigWriter.new(non_empty).write_keys(hash)).to eq result
      end
    end
  end
end
