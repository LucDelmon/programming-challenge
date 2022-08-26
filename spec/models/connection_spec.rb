# frozen_string_literal: true

require 'rspec'

RSpec.describe XmlParser::Connection do
  let(:fare1) { instance_double(XmlParser::Fare, to_s: 'fare_1_to_s') }
  let(:fare2) { instance_double(XmlParser::Fare, to_s: 'fare_2_to_s') }
  let(:connection) do
    described_class.new(
      start: 'start',
      finish: 'finish',
      departure_time: 'departure_time',
      arrival_time: 'arrival_time',
      train_name: 'train_name',
      fares: [fare1, fare2]
    )
  end

  describe '#to_s' do
    it 'returns all the connection info and list the fares' do
      expect(connection.to_s).to eq(
        "Starts at start and ends at finish on train_name at departure_time and arrives at arrival_time.\n   " \
        "Fares:\n      fare_1_to_s\n      fare_2_to_s"
      )
    end
  end
end
