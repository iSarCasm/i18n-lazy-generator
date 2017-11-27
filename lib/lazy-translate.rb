require 'yaml'
require 'deep_merge'
require 'diffy'
require 'pry'

require "lazy-translate/version"
require "lazy-translate/translator"
require "lazy-translate/cli"

require "lazy-translate/file_type"
require "lazy-translate/translation_element"

require "lazy-translate/writers/yaml_config_writer"

require "lazy-translate/updater/config_updater"
require "lazy-translate/updater/source_updater"
require "lazy-translate/updater/source_updater_haml"

require "lazy-translate/generator/key_content"
require "lazy-translate/generator/text_to_key_name"
require "lazy-translate/generator/text_to_key_content"

require "lazy-translate/config_io_yml"

require "lazy-translate/parsers/source_parser_haml"

require "lazy-translate/helper/source_file_reader"
require "lazy-translate/helper/reader_erb"
require "lazy-translate/helper/reader_haml"
require "lazy-translate/helper/html"
require "lazy-translate/helper/yaml"
