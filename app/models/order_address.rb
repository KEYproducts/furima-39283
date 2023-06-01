class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :token, :city, :addresses, :item_id, :user_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: "is invalid. Input only number" },
                             length: { in: 10..11, message: "is too short" }
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses,
                   building: building, phone_number: phone_number, order_id: order.id)
  end
end
