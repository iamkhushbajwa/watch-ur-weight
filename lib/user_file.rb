require "constants"

class UserFile
  include Constants
  attr_reader :category
  attr_reader :weight
  attr_reader :size

  def initialize(extension, size)
    @category = category?(extension)
    gravity = gravity?(@category)
    @size = size
    @weight = round_number(@size * gravity)
    @weight += 100 if @category == "Text"
  end

  def round_number(number)
    (number*20).ceil.to_f/20
  end

  def category?(extension)
    CATEGORIES.each{|key, value|
      return key.to_s.capitalize if value.include?(extension)
    }
    return "Others"
  end

  def gravity?(category)
    GRAVITIES[category.downcase.to_sym]
  end
end