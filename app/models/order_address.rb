class OrderAddress
  include ActiveModel::Model 
  attr_accessor :token, :user_id, :item_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id

    validates :postal_code  , format:{with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality:{other_than: 0, message: "can't be blank"}
    validates :city     
    validates :addresses
    validates :phone_number , format:{with: /\A[0-9]{10,11}\z/, message: "is invalid. Do not include hyphen(-)"}
  end

  def order_save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end


end