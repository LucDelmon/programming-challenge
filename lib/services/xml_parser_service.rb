# frozen_string_literal: true

module XmlParser
  # class XmlParser::XmlParserService
  #
  # Main class for parsing xml file
  class XmlParserService

    def initialize(input_file)
      @input_file = input_file
    end

    # @return [String]
    def call
      Hash.from_xml(@input_file)
    end
  end
end
