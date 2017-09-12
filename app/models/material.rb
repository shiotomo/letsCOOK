# == Schema Information
#
# Table name: materials
#
#  id                 :integer          not null, primary key
#  name               :string
#  amount             :string
#  ingredients_number :integer
#  recipe_id          :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Material < ApplicationRecord
  belongs_to :recipe
end
