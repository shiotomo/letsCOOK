# == Schema Information
#
# Table name: recipe_ideas
#
#  id         :integer          not null, primary key
#  title      :string
#  user_id    :integer
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RecipeIdea < ApplicationRecord
end
