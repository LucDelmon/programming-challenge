# frozen_string_literal: true

require 'rspec'

RSpec.describe XmlParser::SearchResult do
  let(:connection1) { instance_double(XmlParser::Connection, to_s: 'connection_1_to_s') }
  let(:connection2) { instance_double(XmlParser::Connection, to_s: 'connection_2_to_s') }
  let(:search_result) do
    described_class.new(
      id: 'id',
      connections: [connection1, connection2]
    )
  end

  describe '#to_s' do
    before { allow(search_result).to receive(:changes_count).and_return(4) }

    it 'returns the id and list the connections' do
      expect(search_result.to_s).to eq(
        "ID: id\nConnections (4 train changes):\n   connection_1_to_s\n   ↳\n   connection_2_to_s"
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
end
