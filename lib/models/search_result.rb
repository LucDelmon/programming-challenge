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

    def to_s
      "Total Duration: #{XmlParser::Helpers.duration_as_h_m_string(total_duration)}\n" \
        "ID: #{id}\nConnections (#{changes_count} train changes):\n   #{connections_join}"
    end

    # @return [Integer]
    def changes_count
      @connections.count - 1
    end

    # @return [Integer]
    def total_duration
      (Time.parse(@connections.last.arrival_time) - Time.parse(@connections.first.departure_time)).to_i
    end

    private

    # @return [String]
    def connections_join
      @connections.each_with_index.map do |connection, index|
        "#{connection}\n" + connection_transition(index)
      end.join
    end

    # @param [Integer] index
    # @return [String]
    def connection_transition(index)
      if index == @connections.count - 1
        ''
      else
        transition_duration = (
          Time.parse(@connections[index + 1].departure_time) - Time.parse(@connections[index].arrival_time)
        ).to_i
        "   ↳ #{XmlParser::Helpers.duration_as_h_m_string(transition_duration)} wait\n   "
      end
    end
  end
end
