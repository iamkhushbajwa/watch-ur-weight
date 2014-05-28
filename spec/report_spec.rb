require "spec_helper"
require "report"

describe Report do
  let(:report) {Report.new}
  let(:response){ File.read("spec/sample_response.json") }
  let(:parsed) { report.json(response) }
  let(:files) { report.extract_files(parsed) }
  let(:categories) { report.extract_categories(files) }

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
    expect(files.count).to eq 7
    expect(files[0].category).to eq "Videos"
    expect(files[0].weight).to eq 14336.00
  end

  it "can return a hash of hashes with details about each category" do
    result = {files_count: 2, total_weight: 43008.00}
    expect(report.extract_categories(files)["Videos"]).to eq result
  end

  it "can return the total weight of files" do
    expect(report.total_weight(categories)).to eq 276282.25
  end

  it "can return the total ideal weight of files" do
    expect(report.total_ideal_weight(files)).to eq 262860
  end

  it "can return the total displacement of files" do
    expect(report.displacement(categories, files)).to eq 13422.25
  end

  xit "can produce a report based on the input" do
  end
end