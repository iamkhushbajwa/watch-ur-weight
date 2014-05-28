require "spec_helper"
require "user_file"

describe UserFile do
  let(:file1) {UserFile.new("avi", 10240)}
  let(:file2) {UserFile.new("mp3", 3584)}
  let(:file3) {UserFile.new("odt", 1126)}
  let(:file4) {UserFile.new("docx", 2048)}
  let(:file5) {UserFile.new("bin", 225280)}
  let(:file6) {UserFile.new("txt", 102)}
  let(:file7) {UserFile.new("nothing", 20480)}
  
  context "File Types" do
    it { file1.category.should eq 'Videos' }
    it { file2.category.should eq 'Songs' }
    it { file3.category.should eq 'Documents' }
    it { file4.category.should eq 'Documents' }
    it { file5.category.should eq 'Binaries' }
    it { file6.category.should eq 'Text' }
    it { file7.category.should eq 'Others' }
  end

  context "File Weight" do
    it { file1.weight.should eq 14336.00 }
    it { file2.weight.should eq 4300.80 }
    it { file3.weight.should eq 1238.60 }
    it { file5.weight.should eq 225280.00 }
    it { file6.weight.should eq 102.00 }
    it { file7.weight.should eq 20480.00}
  end
end