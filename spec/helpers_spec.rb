# frozen_string_literal: true

require 'rspec'

RSpec.describe XmlParser::Helpers do
  describe '.duration_as_h_m_string' do
    let(:call) { described_class.duration_as_h_m_string(duration) }

    context 'with a normal duration' do
      let(:duration) { (5 * 3600) + (33 * 60) }

      it 'returns the duration of the connection as hours and minutes' do
        expect(call).to eq('5h 33m')
      end
    end

    context 'with a duration without extra minutes' do
      let(:duration) { (1 * 3600) }

      it 'returns the duration of the connection as hours and minutes' do
        expect(call).to eq('1h 0m')
      end
    end
  end
end
