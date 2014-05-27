require "spec_helper"
require "user_file"

describe UserFile do
  context "File Types" do
    it { UserFile.new("avi", 0).category.should eq 'Videos' }
    it { UserFile.new("mp3", 0).category.should eq 'Songs' }
    it { UserFile.new("odt", 0).category.should eq 'Documents' }
    it { UserFile.new("docx", 0).category.should eq 'Documents' }
    it { UserFile.new("bin", 0).category.should eq 'Binaries' }
    it { UserFile.new("txt", 0).category.should eq 'Text' }
    it { UserFile.new("nothing", 0).category.should eq 'Others' }
  end

  context "File Gravity" do
    it { UserFile.new("avi", 0).gravity.should eq 1.4 }
    it { UserFile.new("mp3", 0).gravity.should eq 1.2 }
    it { UserFile.new("odt", 0).gravity.should eq 1.1 }
    it { UserFile.new("bin", 0).gravity.should eq 1.0 }
    it { UserFile.new("txt", 0).gravity.should eq 1.0 }
    it { UserFile.new("nothing", 0).gravity.should eq 1.0}
  end

  it "can be initialised with a size" do
    UserFile.new("avi", 10240).size.should eq 10240
  end
end