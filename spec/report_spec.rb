require "spec_helper"
require "report"

describe Report do
  let(:report) {Report.new}
  let(:response){ File.read("spec/sample_response.json") }

  it "can load a user's files" do
    username = ENV['TEST_USERNAME']
    password = ENV['TEST_PASSWORD']
    apikey = ENV['TEST_APIKEY']
    response2 = report.list_files(username, password, apikey)
    expect(report.json(response2)).to have_key('files')
  end

  it "can parse the response" do
    expect(report.json(response)).to have_key('files')
  end

  it "can extract files from the parsed json" do
    parsed = report.json(response)
    files = report.extract_files(parsed)
    expect(files.count).to eq 7
    expect(files[0].category).to eq "Videos"
    expect(files[0].weight).to eq 14336.00
  end
end