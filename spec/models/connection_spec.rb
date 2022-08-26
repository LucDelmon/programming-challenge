# frozen_string_literal: true

require 'rspec'

RSpec.describe XmlParser::Connection do
  let(:fare1) { instance_double(XmlParser::Fare, to_s: 'fare_1_to_s', price: 10.2) }
  let(:fare2) { instance_double(XmlParser::Fare, to_s: 'fare_2_to_s', price: 10.1) }
  let(:fare3) { instance_double(XmlParser::Fare, to_s: 'fare_3_to_s', price: 10.4) }
  let(:departure_time) { Time.parse('2015-07-11T22:25:00+02:00') }
  let(:arrival_time) { Time.parse('2015-07-24T10:25:00+02:00') }
  let(:connection) do
    described_class.new(
      start: 'start',
      finish: 'finish',
      departure_time: departure_time,
      arrival_time: arrival_time,
      train_name: 'train_name',
      fares: [fare1, fare2, fare3]
    )
  end

  describe '#duration' do
    it 'returns the duration of the connection' do
      expect(connection.duration).to eq((arrival_time - departure_time).to_i)
    end
  end

  describe '#lowest_fare' do
    let(:fares) { [fare1, fare2] }

    it 'returns the lowest fare' do
      expect(connection.lowest_fare).to eq(fare2.price)
    end
  end

  describe '#to_s' do
    let(:departure_time) { 'departure_time' }
    let(:arrival_time) { 'arrival_time' }

    before do
      allow(connection).to receive(:duration).and_return(:duration_int)
      allow(XmlParser::Helpers).to receive(:duration_as_h_m_string).and_return('duration_string')
    end

    it 'returns all the connection info and list the fares' do
      expect(connection.to_s).to eq(
        "Starts at start and ends at finish on train_name at departure_time and arrives at arrival_time.\n   " \
        "Duration: duration_string\n   " \
        "Fares:\n      fare_1_to_s\n      fare_2_to_s\n      fare_3_to_s"
      )
      expect(XmlParser::Helpers).to have_received(:duration_as_h_m_string).with(:duration_int)
    end
  end
end
