class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  validates :image, :name, :text,
            presence: true
  validates :category_id, :sales_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id,
            numericality: { other_than: 1, message: "can't be blank" }
  validates :price,
            presence: true,
            numericality: { other_than: 0, message: 'is invalid. Input half-width characters' },
            inclusion: { in: 300..9_999_999, message: 'is out of setting range' }
end
