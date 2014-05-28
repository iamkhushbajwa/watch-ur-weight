require "spec_helper"
require "user_file"

describe UserFile do
  let(:file1) {UserFile.new("avi", 10485760)}
  let(:file2) {UserFile.new("mp3", 3670016)}
  let(:file3) {UserFile.new("odt", 1153024)}
  let(:file4) {UserFile.new("docx", 2097152)}
  let(:file5) {UserFile.new("bin", 230686720)}
  let(:file6) {UserFile.new("txt", 104448)}
  let(:file7) {UserFile.new("nothing", 20971520)}
  
  context "File Types" do
    it { file1.category.should eq 'Video' }
    it { file2.category.should eq 'Song' }
    it { file3.category.should eq 'Document' }
    it { file4.category.should eq 'Document' }
    it { file5.category.should eq 'Binary' }
    it { file6.category.should eq 'Text' }
    it { file7.category.should eq 'Other' }
  end

  context "File Weight" do
    it { file1.weight.should eq 14336.00 }
    it { file2.weight.should eq 4300.80 }
    it { file3.weight.should eq 1238.60 }
    it { file5.weight.should eq 225280.00 }
    it { file6.weight.should eq 202.00 }
    it { file7.weight.should eq 20480.00}
  end

  context "Rounding numbers" do
    specify "1.04 to 1.05" do
      expect(file1.round_to_nearest_0_05(1.04)).to eq 1.05
    end

    specify "1.06 to 1.10" do
      expect(file1.round_to_nearest_0_05(1.06)).to eq 1.10
    end

    specify "1.2 to 1.2" do
      expect(file1.round_to_nearest_0_05(1.2)).to eq 1.2
    end
  end
end