require 'yaml'
require 'deep_merge'
require "lazy-translate/version"

require "lazy-translate/cli"

require "lazy-translate/source_updater/source_updater"
require "lazy-translate/config_updater/config_updater"


require "lazy-translate/generator/key_name_generator"
require "lazy-translate/generator/key_content_generator"

require "lazy-translate/parser/parser"
require "lazy-translate/parser/parsed_element"
require "lazy-translate/parser/text_element"
require "lazy-translate/parser/white_space_element"
require "lazy-translate/parser/haml/haml_tag_element"
require "lazy-translate/parser/haml/haml_text_element"
require "lazy-translate/parser/haml/haml_erb_element"
require "lazy-translate/parser/haml/haml_parser"

require "lazy-translate/helper/erb"
require "lazy-translate/helper/html"
require "lazy-translate/helper/yaml"
