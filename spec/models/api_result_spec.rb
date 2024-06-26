# frozen_string_literal: true

require 'rspec'

RSpec.describe XmlParser::ApiResult do
  let(:search_result1) { instance_double(XmlParser::SearchResult, total_duration: 5, total_lowest_fare: 9.4) }
  let(:search_result2) { instance_double(XmlParser::SearchResult, total_duration: 4, total_lowest_fare: 9.5) }
  let(:search_result3) { instance_double(XmlParser::SearchResult, total_duration: 6, total_lowest_fare: 12) }
  let(:api_result) { described_class.new(search_results: [search_result1, search_result2, search_result3]) }

  describe '#quickest_result' do
    it 'returns the quickest search result' do
      expect(api_result.quickest_result).to eq(search_result2)
    end
  end

  describe '#cheapest_result' do
    it 'returns the cheapest search result' do
      expect(api_result.quickest_result).to eq(search_result2)
    end
  end
end
