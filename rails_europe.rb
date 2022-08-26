# frozen_string_literal: true

require 'active_support/core_ext/hash'
require 'active_support/isolated_execution_state'
require 'active_support/xml_mini'
require 'awesome_print'
require 'time'
require_relative 'lib/xml_parser'

input_file = File.read('./task/search.xml')
xml_parser_service = XmlParser::XmlParserService.new(input_file)
xml_parser_service.call
