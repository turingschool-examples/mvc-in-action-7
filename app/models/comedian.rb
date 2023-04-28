class Comedian < ApplicationRecord
  has_many :specials

  validates_presence_of :name
  validates_presence_of :age

  def self.average_age
    average(:age)
    # "#{average(:age).round(2)} Years"
  end

  def average_special_runtime
    specials.average(:runtime)
  end

  def count_of_specials
    specials.count
  end

  def longest_special
    specials.maximum(:runtime)
    # longest_array = specials.order(runtime: :desc).limit(1)
    # longest_array[0].runtime
  end
end
