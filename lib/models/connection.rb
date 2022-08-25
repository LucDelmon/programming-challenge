# frozen_string_literal: true

module XmlParser
  # class XmlParser::Connection
  #
  # Represent a Connection
  class Connection
    attr_reader :start, :finish, :departure_time, :arrival_time, :train_name, :fares

    # @param [Array<XmlParser::Fare>] fares
    # @param [String] start
    # @param [String] finish
    # @param [String] departure_time
    # @param [String] arrival_time
    # @param [String] train_name
    def initialize(start:, finish:, departure_time:, arrival_time:, train_name:, fares:)
      @start = start
      @finish = finish
      @departure_time = departure_time
      @arrival_time = arrival_time
      @train_name = train_name
      @fares = fares
    end
  end
end
