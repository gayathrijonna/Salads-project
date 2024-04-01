class CreateUsercarts < ActiveRecord::Migration[7.0]
  def change
    create_table :usercarts do |t|
      t.string :dressing_at

      t.timestamps
    end
  end
end
