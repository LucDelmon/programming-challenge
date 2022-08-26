# frozen_string_literal: true

module XmlParser
  # class XmlParser::DataPresenterService
  #
  # class for printing an api_result into the console
  class DataPresenterService
    # @param [api_result] api_result
    def initialize(api_result)
      @api_result = api_result
    end

    # @return [nil]
    def call
      puts "Quickest: #{@api_result.quickest_result.id}"
      puts "Cheapest: #{@api_result.cheapest_result.id}"
      @api_result.search_results.each do |search_result|
        puts '------Search Result------'
        puts search_result.to_s
      end
    end
  end
end
