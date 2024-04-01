# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  counter                :integer          default(10)
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reg_done               :boolean
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many(
  :userdata,
  class_name:  'Userdatum',
  foreign_key: 'user_id',
  inverse_of:  :userdata,
  dependent:   :destroy
)

has_many(
  :delivery_profiles,
  class_name:  'DeliveryProfile',
  foreign_key: 'user_id',
  inverse_of:  :delivery_profiles,
  dependent:   :destroy
)
end
