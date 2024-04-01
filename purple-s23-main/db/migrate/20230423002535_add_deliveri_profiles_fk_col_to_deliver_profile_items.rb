class AddDeliveriProfilesFkColToDeliverProfileItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :delivery_profile_items, :delivery_profiles, foreign_key: true
  end
end
