# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  comments   :string
#  content    :string
#  dislikes   :integer
#  likes      :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
end
