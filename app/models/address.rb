class Address < ApplicationRecord
  belongs_to :order, dependent: :destroy
end
