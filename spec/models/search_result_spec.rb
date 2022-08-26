# frozen_string_literal: true

require 'rspec'

RSpec.describe XmlParser::SearchResult do
  let(:arrival_time) { Time.parse('2015-07-12T06:48:00+02:00') }
  let(:departure_time) { Time.parse('2015-07-12T09:57:00+02:00') }
  let(:connection1) { instance_double(XmlParser::Connection, to_s: 'connection_1_to_s', arrival_time: arrival_time) }
  let(:connection2) { instance_double(XmlParser::Connection, to_s: 'connection_2_to_s', departure_time: departure_time) }
  let(:search_result) do
    described_class.new(
      id: 'id',
      connections: [connection1, connection2]
    )
  end
  let(:expected_transition_duration) { (departure_time - arrival_time).to_i }

  describe '#to_s' do
    before do
      allow(search_result).to receive(:changes_count).and_return(4)
      allow(search_result).to receive(:total_duration).and_return(:total_duration_value)
      allow(XmlParser::Helpers).to receive(:duration_as_h_m_string).with(expected_transition_duration).and_return('transition_duration')
      allow(XmlParser::Helpers).to receive(:duration_as_h_m_string).with(:total_duration_value).and_return('total_duration')
    end

    it 'returns the id and list the connections with the transition time when relevant' do
      expect(search_result.to_s).to eq(
        "Total Duration: total_duration\nID: id\nConnections (4 train changes):\n   " \
        "connection_1_to_s\n   ↳ transition_duration wait\n   connection_2_to_s\n"
      )
    end
  end

  describe '#changes_count' do
    let(:search_result) do
      described_class.new(
        id: 'id',
        connections: [connection1, connection1, connection1, connection1] # 4 connections
      )
    end

    it 'returns the number of connections minus 1' do
      expect(search_result.changes_count).to eq(3)
    end
  end

  describe '#total_duration' do
    let(:connection1) do
      instance_double(
        XmlParser::Connection,
        to_s: 'connection_1_to_s',
        departure_time: Time.parse('2015-07-12T06:48:00+02:00'),
        arrival_time: Time.parse('2015-07-12T08:48:00+02:00')
      )
    end

    let(:connection2) do
      instance_double(
        XmlParser::Connection,
        to_s: 'connection_1_to_s',
        departure_time: Time.parse('2015-07-12T09:48:00+02:00'),
        arrival_time: Time.parse('2015-07-12T13:24:00+02:00')
      )
    end

    it 'returns total duration of the search result' do
      expect(search_result.total_duration).to eq(
        (connection2.arrival_time - connection1.departure_time).to_i
      )
    end
  end

  describe '#total_lowest_fare' do
    let(:connection1) { instance_double(XmlParser::Connection, lowest_fare: 11.4) }
    let(:connection2) { instance_double(XmlParser::Connection, lowest_fare: 2.5) }

    it 'returns the sum of the lowest fare' do
      expect(search_result.total_lowest_fare).to eq(13.9)
    end
  end
end
