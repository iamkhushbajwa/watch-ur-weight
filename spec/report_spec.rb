require "spec_helper"
require "report"

describe Report do
  let(:report) {Report.new}
  it "can parse the response" do
    response = File.read("spec/sample_response.json")
    expect(report.json(response)).to have_key('files')
  end
end