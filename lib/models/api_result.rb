# frozen_string_literal: true

module XmlParser
  # class XmlParser::SearchResult
  #
  # Represent an ApiResult
  class ApiResult
    attr_reader :search_results

    # @param search_results [Array<XmlParser::SearchResult>]
    def initialize(search_results:)
      @search_results = search_results
    end

    def quickest_result
      @search_results.min_by(&:total_duration)
    end

    def cheapest_result; end
  end
end
