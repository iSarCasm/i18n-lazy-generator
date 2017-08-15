require 'yaml'
require 'deep_merge'
require "lazy-translate/version"

require "lazy-translate/cli"

require "lazy-translate/source_updater/source_updater"
require "lazy-translate/config_updater/config_updater"


require "lazy-translate/generator/text_to_key_name"
require "lazy-translate/generator/text_to_key_content"

require "lazy-translate/parser/parser"
require "lazy-translate/parser/parsed_element"
require "lazy-translate/parser/parsed_elements/text_element"
require "lazy-translate/parser/parsed_elements/white_space_element"
require "lazy-translate/parser/parsed_elements/haml/haml_tag_element"
require "lazy-translate/parser/parsed_elements/haml/haml_text_element"
require "lazy-translate/parser/parsed_elements/haml/haml_erb_element"
require "lazy-translate/parser/parsed_elements/haml/haml_parser"

require "lazy-translate/helper/erb"
require "lazy-translate/helper/html"
require "lazy-translate/helper/yaml"
