# frozen_string_literal: true

require 'rspec'

RSpec.describe XmlParser::XmlParserService do
  let(:input_file) { 'xml_file' }
  let(:loader_service) { instance_double(XmlParser::DataLoaderService) }
  let(:presenter_service) { instance_double(XmlParser::DataPresenterService, call: nil) }

  before do
    allow(Hash).to receive(:from_xml).with(input_file).and_return(:hash_file)
    allow(XmlParser::DataLoaderService).to receive(:new).with(:hash_file).and_return(loader_service)
    allow(loader_service).to receive(:call).and_return(:api_result)
    allow(XmlParser::DataPresenterService).to receive(:new).with(:api_result).and_return(presenter_service)
  end

  it 'loads the search results from the provided file and call the presenter service on them' do
    described_class.new(input_file).call
    expect(Hash).to have_received(:from_xml).with(input_file).ordered
    expect(XmlParser::DataLoaderService).to have_received(:new).with(:hash_file).ordered
    expect(loader_service).to have_received(:call).ordered
    expect(XmlParser::DataPresenterService).to have_received(:new).with(:api_result).ordered
    expect(presenter_service).to have_received(:call).ordered
  end
end
