# frozen_string_literal: true

require 'rspec'

RSpec.describe XmlParser::Connection do
  let(:fare1) { instance_double(XmlParser::Fare, to_s: 'fare_1_to_s') }
  let(:fare2) { instance_double(XmlParser::Fare, to_s: 'fare_2_to_s') }
  let(:connection) do
    described_class.new(
      start: 'start',
      finish: 'finish',
      departure_time: departure_time,
      arrival_time: arrival_time,
      train_name: 'train_name',
      fares: [fare1, fare2]
    )
  end

  describe '#to_s' do
    let(:departure_time) { 'departure_time' }
    let(:arrival_time) { 'arrival_time' }

    before { allow(connection).to receive(:duration_string).and_return('duration_string') }

    it 'returns all the connection info and list the fares' do
      expect(connection.to_s).to eq(
        'Starts at start and ends at finish on train_name at departure_time and arrives at arrival_time. ' \
        "Duration: duration_string\n   " \
        "Fares:\n      fare_1_to_s\n      fare_2_to_s"
      )
    end
  end

  describe '#duration_string' do
    context 'with a normal duration' do
      let(:departure_time) { '2015-07-11T22:25:00+02:00' }
      let(:arrival_time) { '2015-07-12T03:58:00+02:00' }

      it 'returns the duration of the connection as hours and minutes' do
        expect(connection.duration_string).to eq('5h 33m')
      end

    end

    context 'with a duration without extra minutes' do
      let(:departure_time) { '2015-07-11T22:25:00+02:00' }
      let(:arrival_time) { '2015-07-11T23:25:00+02:00' }

      it 'returns the duration of the connection as hours and minutes' do
        expect(connection.duration_string).to eq('1h 0m')
      end
    end
  end
end
