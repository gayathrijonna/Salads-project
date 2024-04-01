class AddUserVitalsFkColToUserData < ActiveRecord::Migration[7.0]
  def change
    add_reference :user_vitals_and_preferences, :userdata, foreign_key: true
  end
end
