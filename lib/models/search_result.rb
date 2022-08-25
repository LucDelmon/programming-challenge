# frozen_string_literal: true

module XmlParser
  # class XmlParser::SearchResult
  #
  # Represent a SearchResult
  class SearchResult
    attr_reader :id, :connections

    # @param id [String]
    # @param connections [Array]
    def initialize(id:, connections:)
      @id = id
      @connections = connections
    end
  end
end
