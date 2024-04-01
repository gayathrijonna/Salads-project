# == Schema Information
#
# Table name: payments
#
#  id             :bigint           not null, primary key
#  cardholdername :string
#  cardnumber     :integer
#  cvv            :integer
#  expirydate     :integer
#  paymentstatus  :string
#  zipcode        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Payment < ApplicationRecord
end
