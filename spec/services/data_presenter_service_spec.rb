# frozen_string_literal: true

require 'rspec'

RSpec.describe XmlParser::DataPresenterService do
  let(:first_search_result) { XmlParser::SearchResult.new(id: 'first_id', connections: []) }
  let(:second_search_result) { XmlParser::SearchResult.new(id: 'second_id', connections: []) }
  let(:api_result) { XmlParser::ApiResult.new(search_results: [first_search_result, second_search_result]) }

  before do
    allow(first_search_result).to receive(:to_s).and_return('first_search_result_to_s')
    allow(second_search_result).to receive(:to_s).and_return('second_search_result_to_s')
    allow(api_result).to receive(:quickest_result).and_return(instance_double(XmlParser::SearchResult, id: 'quickest_id'))
    allow(api_result).to receive(:cheapest_result).and_return(instance_double(XmlParser::SearchResult, id: 'cheapest_id'))
  end

  it 'prints the search results in the console' do
    presenter = described_class.new(api_result)
    expect { presenter.call }.to output(
      "Quickest: quickest_id\nCheapest: cheapest_id\n" \
      "------Search Result------\nfirst_search_result_to_s\n" \
      "------Search Result------\nsecond_search_result_to_s\n"
    ).to_stdout
  end
end
