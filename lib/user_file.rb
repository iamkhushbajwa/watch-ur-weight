require "constants"

class UserFile
  include Constants
  attr_reader :category
  attr_reader :weight

  def initialize(extension, size)
    @category = category?(extension)
    gravity = gravity?(@category)
    @weight = round_number(size * gravity)
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