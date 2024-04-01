# == Schema Information
#
# Table name: icategories
#
#  id         :bigint           not null, primary key
#  itype      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Icategory < ApplicationRecord
    has_many(
        :ingredients,
        class_name:  'Icategory',
        foreign_key: 'icategory_id',
        dependent:   :destroy
      )
end
