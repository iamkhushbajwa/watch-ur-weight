require "spec_helper"
require "report"

describe Report do
  let(:report) {Report.new}

  it "can load a user's files" do
    username = ENV['TEST_USERNAME']
    password = ENV['TEST_PASSWORD']
    apikey = ENV['TEST_APIKEY']
    response = report.list_files(username, password, apikey)
    expect(report.json(response)).to have_key('files')
  end

  it "can parse the response" do
    response = File.read("spec/sample_response.json")
    expect(report.json(response)).to have_key('files')
  end

  it "can extract files from the parsed json" do
    response = File.read("spec/sample_response.json")
    parsed = report.json(response)
    files = report.extract_files(parsed)
    expect(files.count).to eq 7
    expect(files[0].category).to eq "Videos"
    expect(files[0].weight).to eq "14336.00"
  end
end