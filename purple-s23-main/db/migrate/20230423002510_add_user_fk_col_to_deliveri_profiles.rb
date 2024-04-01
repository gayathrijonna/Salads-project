class AddUserFkColToDeliveriProfiles < ActiveRecord::Migration[7.0]
  def change
    add_reference :delivery_profiles, :userdata, foreign_key: true
  end
end
