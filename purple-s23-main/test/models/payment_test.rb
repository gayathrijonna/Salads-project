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
require "test_helper"

class PaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
