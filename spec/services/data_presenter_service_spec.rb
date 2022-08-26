# frozen_string_literal: true

require 'rspec'

RSpec.describe XmlParser::DataPresenterService do
  let(:first_search_result) { XmlParser::SearchResult.new(id: 'first_id', connections: []) }
  let(:second_search_result) { XmlParser::SearchResult.new(id: 'second_id', connections: []) }

  before do
    allow(first_search_result).to receive(:to_s).and_return('first_search_result_to_s')
    allow(second_search_result).to receive(:to_s).and_return('second_search_result_to_s')
  end

  it 'prints the search results in the console' do
    search_results = [first_search_result, second_search_result]
    presenter = described_class.new(search_results)
    expect { presenter.call }.to output(
      "------Search Result------\nfirst_search_result_to_s\n" \
      "------Search Result------\nsecond_search_result_to_s\n"
    ).to_stdout
  end
end
