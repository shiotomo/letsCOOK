# == Schema Information
#
# Table name: progresses
#
#  id           :integer          not null, primary key
#  content      :text
#  order_number :integer
#  recipe_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Progress < ApplicationRecord
  belongs_to :recipe
end
