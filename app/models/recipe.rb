# == Schema Information
#
# Table name: recipes
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  postdate   :date
#  memo       :string
#  date       :date             not null
#  category   :text             default("0"), not null
#

class Recipe < ApplicationRecord
  enum status: {
    japanese_food: 0,
    western_food: 1,
    italian_food: 2,
    french_food: 3,
    chainese_food: 4,
    dessert: 5,
    sweets: 6,
    other: 7
  }

  has_many :materials, inverse_of: :recipe, dependent: :destroy
  accepts_nested_attributes_for :materials, reject_if: :all_blank, allow_destroy: true

  has_many :progresses, inverse_of: :recipe, dependent: :destroy
  accepts_nested_attributes_for :progresses, reject_if: :all_blank, allow_destroy: true

  has_many :favorite, dependent: :destroy
end
