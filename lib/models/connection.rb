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
    # @param [Time] departure_time
    # @param [Time] arrival_time
    # @param [String] train_name
    def initialize(start:, finish:, departure_time:, arrival_time:, train_name:, fares:)
      @start = start
      @finish = finish
      @departure_time = departure_time
      @arrival_time = arrival_time
      @train_name = train_name
      @fares = fares
    end

    def to_s
      "Starts at #{start} and ends at #{finish} on #{train_name} at #{departure_time} and arrives at #{arrival_time}.\n   " \
        "Duration: #{XmlParser::Helpers.duration_as_h_m_string(duration)}\n   " \
        "Fares:\n      #{fares.join("\n      ")}"
    end

    # @return [Integer]
    def duration
      (arrival_time - departure_time).to_i
    end

    # @return [Float]
    def lowest_fare
      fares.min_by(&:price).price
    end
  end
end
