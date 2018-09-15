# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  star       :boolean          default(FALSE)
#  recipe_id  :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Favorite < ApplicationRecord
  belongs_to :recipe
end
