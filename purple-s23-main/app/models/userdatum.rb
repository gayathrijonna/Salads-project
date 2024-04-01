# == Schema Information
#
# Table name: userdata
#
#  id         :bigint           not null, primary key
#  address    :string
#  emailid    :string
#  firstname  :string
#  lastname   :string
#  mobile     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_userdata_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Userdatum < ApplicationRecord
    has_one(
    :usercarts,
    class_name:  'Usercart',
    foreign_key: 'userdata_id',
    dependent:   :destroy,
    inverse_of: :usercarts
  )

  has_one(
    :user_vitals_and_preferences,
    class_name:  'UserVitalsAndPreference',
    foreign_key: 'userdata_id',
    dependent:   :destroy,
    inverse_of: :user_vitals_and_preferences
  )

  has_many(
    :delivery_profiles,
    class_name:  'DeliveryProfile',
    foreign_key: 'userdata_ids',
    dependent:   :destroy,
    inverse_of: :delivery_profiles
  )

  belongs_to(
    :user,
    class_name:  'User',
    foreign_key: 'user_id'
  )

  validates :emailid, presence: true
end
