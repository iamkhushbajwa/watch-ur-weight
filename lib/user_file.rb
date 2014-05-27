CATEGORIES = {
      videos: ["avi"],
      songs: ["mp3"],
      documents: ["odt", "docx"],
      binaries: ["bin"],
      text: ["txt"]
    }

class UserFile
  attr_reader :category
  attr_reader :gravity

  def initialize(extension)
    @category = category?(extension)
    @gravity = gravity?(@category)
  end

  def category?(extension)
    CATEGORIES.each{|key, value|
      return key.to_s.capitalize if value.include?(extension)
    }
    return "Others"
  end

  def gravity?(category)
    {
      videos: 1.4,
      songs: 1.2,
      documents: 1.1,
      binaries: 1.0,
      text: 1.0,
      others: 1.0
    }[category.downcase.to_sym]
  end
end