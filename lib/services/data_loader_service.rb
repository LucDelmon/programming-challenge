# frozen_string_literal: true

module XmlParser
  # class XmlParser::DataLoaderService
  #
  # class for loading data from a Hash into our models
  class DataLoaderService
    # @param [Hash] data_hash
    def initialize(data_hash)
      @data_hash= data_hash
    end

    # @return [Array]
    def call
      []
    end
  end
end
