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
    it { report.category?("mp3").should eq 'Songs' }
    it { report.category?("odt").should eq 'Documents' }
    it { report.category?("docx").should eq 'Documents' }
    it { report.category?("bin").should eq 'Binaries' }
    it { report.category?("txt").should eq 'Text' }
    it { report.category?("nothing").should eq 'Others' }
  end

  context "File Gravity" do
    it { report.gravity("Videos").should eq 1.4 }
    it { report.gravity("Songs").should eq 1.2 }
    it { report.gravity("Documents").should eq 1.1 }
    it { report.gravity("Binaries").should eq 1 }
    it { report.gravity("Text").should eq 1 }
    it { report.gravity("Others").should eq 1 }
  end
end