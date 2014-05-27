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
  
  context "File Types" do
    it { report.category?("avi").should eq 'Videos' }
  end
end