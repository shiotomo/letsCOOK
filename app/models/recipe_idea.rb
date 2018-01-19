# == Schema Information
#
# Table name: recipe_ideas
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  user_id    :integer          not null
#  content    :text
#  date       :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RecipeIdea < ApplicationRecord
end
