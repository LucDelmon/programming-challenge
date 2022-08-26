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
    it 'returns the id and list the connections' do
      expect(search_result.to_s).to eq(
        "ID: id\nConnections:\n   connection_1_to_s\n   connection_2_to_s"
      )
    end
  end
end
