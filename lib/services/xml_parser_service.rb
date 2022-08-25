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
      search_results = XmlParser::DataLoaderService.new(Hash.from_xml(@input_file)).call
      search_results.each do |search_result|
        XmlParser::DataPresenterService.new(search_result).call
      end
    end
  end
end
