require 'yaml'
require 'deep_merge'
require "i18n-lazy-generator/version"

require "i18n-lazy-generator/cli"

require "i18n-lazy-generator/source_updater/source_updater"
require "i18n-lazy-generator/config_updater/config_updater"


require "i18n-lazy-generator/generator/key_name_generator"
require "i18n-lazy-generator/generator/key_content_generator"

require "i18n-lazy-generator/parser/parser"
require "i18n-lazy-generator/parser/parsed_element"
require "i18n-lazy-generator/parser/text_element"
require "i18n-lazy-generator/parser/white_space_element"
require "i18n-lazy-generator/parser/haml/haml_tag_element"
require "i18n-lazy-generator/parser/haml/haml_text_element"
require "i18n-lazy-generator/parser/haml/haml_erb_element"
require "i18n-lazy-generator/parser/haml/haml_parser"

require "i18n-lazy-generator/helper/erb"
require "i18n-lazy-generator/helper/html"
require "i18n-lazy-generator/helper/yaml"
