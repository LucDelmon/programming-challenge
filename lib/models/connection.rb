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

    def to_s
      "Starts at #{start} and ends at #{finish} on #{train_name} at #{departure_time} and arrives at #{arrival_time}.\n   " \
        "Duration: #{duration_string}\n   " \
        "Fares:\n      #{fares.join("\n      ")}"
    end

    def duration_string
      duration = (Time.parse(arrival_time) - Time.parse(departure_time)).to_i
      hours = duration / 3600
      minutes = (duration % 3600) / 60
      "#{hours}h #{minutes}m"
    end
  end
end
