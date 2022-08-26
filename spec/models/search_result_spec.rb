# frozen_string_literal: true

require 'rspec'

RSpec.describe XmlParser::SearchResult do
  let(:arrival_time) { '2015-07-12T06:48:00+02:00' }
  let(:departure_time) { '2015-07-12T09:57:00+02:00' }
  let(:connection1) { instance_double(XmlParser::Connection, to_s: 'connection_1_to_s', arrival_time: arrival_time) }
  let(:connection2) { instance_double(XmlParser::Connection, to_s: 'connection_2_to_s', departure_time: departure_time) }
  let(:search_result) do
    described_class.new(
      id: 'id',
      connections: [connection1, connection2]
    )
  end

  describe '#to_s' do
    before do
      allow(search_result).to receive(:changes_count).and_return(4)
      allow(XmlParser::Helpers).to receive(:duration_as_h_m_string).and_return('transition_duration')
    end

    it 'returns the id and list the connections with the transition time when revelant' do
      expected_duration = (Time.parse(departure_time) - Time.parse(arrival_time)).to_i
      expect(search_result.to_s).to eq(
        "ID: id\nConnections (4 train changes):\n   connection_1_to_s\n   ↳ transition_duration wait\n   connection_2_to_s\n"
      )
      expect(XmlParser::Helpers).to have_received(:duration_as_h_m_string).with(expected_duration)
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
end
