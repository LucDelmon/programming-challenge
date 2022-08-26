# frozen_string_literal: true

module XmlParser
  # class XmlParser::XmlParserService
  #
  # Main class for parsing xml file
  class XmlParserService
    # @param [String] input_file
    def initialize(input_file)
      @input_file = input_file
    end

    # @return [void]
    def call
      api_result = XmlParser::DataLoaderService.new(Hash.from_xml(@input_file)).call
      XmlParser::DataPresenterService.new(api_result).call
    end
  end
end
