# frozen_string_literal: true

require 'rspec'

RSpec.describe XmlParser::Fare do
  let(:fare) { described_class.new(name: 'fare_name', price: 11.1) }

  describe '#to_s' do
    it 'returns the name and price of the fare' do
      expect(fare.to_s).to eq('fare_name - Price: 11.1 GDB')
    end
  end
end
