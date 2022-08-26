# frozen_string_literal: true

module XmlParser
  # class XmlParser::DataLoaderService
  #
  # class for loading data from a Hash into our models
  class DataLoaderService
    # @param [Hash] data_hash
    def initialize(data_hash)
      @data_hash = data_hash
    end

    # @return [Array]
    def call
      load_search_result(@data_hash['SearchResults']['SearchResult'])
    end

    private

    # @param [Array] search_result_array
    # @return [Array]
    def load_search_result(search_result_array)
      search_result_array.map do |search_result|
        XmlParser::SearchResult.new(
          id: search_result['ID'],
          connections: load_connections(search_result['Connections']['Connection'])
        )
      end
    end

    # @param [Array] connection_array
    # @return [Array]
    def load_connections(connection_array)
      connection_array.map do |connection|
        XmlParser::Connection.new(
          start: connection['Start'],
          finish: connection['Finish'],
          departure_time: connection['DepartureTime'],
          arrival_time: connection['ArrivalTime'],
          train_name: connection['TrainName'],
          fares: load_fares(connection['Fares']['Fare'])
        )
      end
    end

    # @param [Array] fare_array
    # @return [Array]
    def load_fares(fare_array)
      fare_array.map do |fare|
        XmlParser::Fare.new(name: fare['Name'], price: fare['Price']['Value'].to_f)
      end
    end
  end
end
