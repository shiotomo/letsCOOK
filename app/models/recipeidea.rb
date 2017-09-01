# == Schema Information
#
# Table name: recipeideas
#
#  id         :integer          not null, primary key
#  title      :string
#  idea       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  content    :text
#

class Recipeidea < ApplicationRecord
end
