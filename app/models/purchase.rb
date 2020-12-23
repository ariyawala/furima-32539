class Purchase
  include ActiveModel::Model
  attr_accessor :zip, :prefecture_id, :city, :address, :building, :phone_no, :order_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :zip, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :address
    validates :phone_no, numericality: { with: /\A[0-9]+\z/, message: 'Input only number' }, length: { maximum: 11 }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zip: zip, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_no: phone_no,
                   order_id: order.id)
  end
end
