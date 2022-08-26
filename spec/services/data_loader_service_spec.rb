# frozen_string_literal: true

require 'rspec'

RSpec.describe XmlParser::DataLoaderService do
  let(:data_hash) do
    {
      'SearchResults' => {
        'SearchResult' => [
          {
            'ID' => 'first_id',
            'Connections' => {
              'Connection' => [
                {
                  'Start' => 'first_start',
                  'Finish' => 'first_finish',
                  'DepartureTime' => '2015-07-12T06:48:00+02:00',
                  'ArrivalTime' => '2015-07-11T14:45:00+02:00',
                  'TrainName' => 'first_train_name',
                  'Fares' => {
                    'Fare' => [
                      {
                        'Name' => 'first_fare_name',
                        'Price' => { 'Currency' => 'GBP', 'Value' => '11.1' }
                      },
                      {
                        'Name' => 'second_fare_name',
                        'Price' => { 'Currency' => 'GBP', 'Value' => '22.2' }
                      }
                    ]
                  }
                },
                {
                  'Start' => 'second_start',
                  'Finish' => 'second_finish',
                  'DepartureTime' => '2015-09-12T06:48:00+02:00',
                  'ArrivalTime' => '2015-07-11T16:45:00+02:00',
                  'TrainName' => 'second_train_name',
                  'Fares' => {
                    'Fare' => [
                      {
                        'Name' => 'third_fare_name',
                        'Price' => { 'Currency' => 'GBP', 'Value' => '33.3' }
                      }
                    ]
                  }
                }
              ]
            }
          },
          {
            'ID' => 'second_id',
            'Connections' => {
              'Connection' => [
                {
                  'Start' => 'third_start',
                  'Finish' => 'third_finish',
                  'DepartureTime' => '2015-09-11T06:45:00+02:00',
                  'ArrivalTime' => '2015-09-11T16:45:00+02:00',
                  'TrainName' => 'third_train_name',
                  'Fares' => {
                    'Fare' => [
                      {
                        'Name' => 'fourth_fare_name',
                        'Price' => { 'Currency' => 'GBP', 'Value' => '44.4' }
                      }
                    ]
                  }
                }
              ]
            }
          }
        ]
      }
    }
  end
  let(:service) { described_class.new(data_hash) }
  let(:service_call) { service.call }

  it 'loads the data into the correct models' do
    expect(service.call).to be_an_instance_of(Array)
    aggregate_failures do
      expect(service.call.first).to be_an_instance_of(XmlParser::SearchResult)
      first_search_result = service_call.first
      expect(first_search_result.id).to eq('first_id')
      expect(first_search_result.connections.first).to be_an_instance_of(XmlParser::Connection)
      first_connection = first_search_result.connections.first
      expect(first_connection.start).to eq 'first_start'
      expect(first_connection.start).to eq 'first_start'
      expect(first_connection.finish).to eq 'first_finish'
      expect(first_connection.departure_time).to eq Time.parse('2015-07-12T06:48:00+02:00')
      expect(first_connection.arrival_time).to eq Time.parse('2015-07-11T14:45:00+02:00')
      expect(first_connection.train_name).to eq 'first_train_name'
      expect(first_connection.fares.first).to be_an_instance_of(XmlParser::Fare)
      expect(first_connection.fares.first.name).to eq 'first_fare_name'
      expect(first_connection.fares.first.price).to eq 11.1
      expect(first_connection.fares[1]).to be_an_instance_of(XmlParser::Fare)
      expect(first_connection.fares[1].name).to eq 'second_fare_name'
      expect(first_connection.fares[1].price).to eq 22.2
      expect(first_search_result.connections[1]).to be_an_instance_of(XmlParser::Connection)
      second_connection = first_search_result.connections[1]
      expect(second_connection.start).to eq 'second_start'
      expect(second_connection.finish).to eq 'second_finish'
      expect(second_connection.departure_time).to eq Time.parse('2015-09-12T06:48:00+02:00')
      expect(second_connection.arrival_time).to eq Time.parse('2015-07-11T16:45:00+02:00')
      expect(second_connection.train_name).to eq 'second_train_name'
      expect(second_connection.fares.first).to be_an_instance_of(XmlParser::Fare)
      expect(second_connection.fares.first.name).to eq 'third_fare_name'
      expect(second_connection.fares.first.price).to eq 33.3
      expect(service.call[1]).to be_an_instance_of(XmlParser::SearchResult)
      second_search_result = service_call[1]
      expect(second_search_result.connections.first).to be_an_instance_of(XmlParser::Connection)
      expect(second_search_result.id).to eq('second_id')
      third_connection = second_search_result.connections.first
      expect(third_connection.start).to eq 'third_start'
      expect(third_connection.finish).to eq 'third_finish'
      expect(third_connection.departure_time).to eq Time.parse('2015-09-11T06:45:00+02:00')
      expect(third_connection.arrival_time).to eq Time.parse('2015-09-11T16:45:00+02:00')
      expect(third_connection.train_name).to eq 'third_train_name'
      expect(third_connection.fares.first).to be_an_instance_of(XmlParser::Fare)
      expect(third_connection.fares.first.name).to eq 'fourth_fare_name'
      expect(third_connection.fares.first.price).to eq 44.4
    end
  end
end
