require "spec_helper"
require "user_file"

describe UserFile do
  context "File Types" do
    it { UserFile.new("avi").category.should eq 'Videos' }
    it { UserFile.new("mp3").category.should eq 'Songs' }
    it { UserFile.new("odt").category.should eq 'Documents' }
    it { UserFile.new("docx").category.should eq 'Documents' }
    it { UserFile.new("bin").category.should eq 'Binaries' }
    it { UserFile.new("txt").category.should eq 'Text' }
    it { UserFile.new("nothing").category.should eq 'Others' }
  end

  context "File Gravity" do
    it { UserFile.new("avi").gravity.should eq 1.4 }
    it { UserFile.new("mp3").gravity.should eq 1.2 }
    it { UserFile.new("odt").gravity.should eq 1.1 }
    it { UserFile.new("bin").gravity.should eq 1.0 }
    it { UserFile.new("txt").gravity.should eq 1.0 }
    it { UserFile.new("nothing").gravity.should eq 1.0}
  end
end