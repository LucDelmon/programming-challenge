# frozen_string_literal: true

module XmlParser
  # class XmlParser::DataPresenterService
  #
  # class for printing a search result into the console
  class DataPresenterService
    # @param [Array<XmlParser::SearchResult>] search_results
    def initialize(search_results)
      @search_results = search_results
    end

    # @return [nil]
    def call
      @search_results.each do |search_result|
        puts '------Search Result------'
        puts search_result.to_s
      end
    end
  end
end
