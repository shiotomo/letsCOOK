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
#

class Recipe < ApplicationRecord
  has_many :materials, inverse_of: :recipe
  # has_many :materials, dependent: :recipe
  accepts_nested_attributes_for :materials, reject_if: :all_blank, allow_destroy: true

  has_many :progresses, inverse_of: :recipe
  # has_many :progresses, dependent: :recipe
  accepts_nested_attributes_for :progresses, reject_if: :all_blank, allow_destroy: true
end
