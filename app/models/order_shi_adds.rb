class OrderShiAdds
  include ActiveModel::Model
  attr_accessor :post_code, :sender_id, :locality, :address, :building, :phone, :order_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}+\Z/, message: "Postal code is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :phone, format: {with: /\A[0-9]{10,11}+\Z/, message: "is invalid. Input half size number characters."}
    validates :user_id
    validates :item_id
    validates :locality
    validates :address
    validates :token
  end
  
  validates :sender_id, numericality: { other_than: 1 , message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShiAdd.create(post_code: post_code, sender_id: sender_id, locality: locality, address: address, building: building, phone: phone, order_id: order.id)
  end
end