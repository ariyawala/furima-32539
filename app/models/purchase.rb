class Purchase
  include ActiveModel::Model
  attr_accessor :zip, :prefecture_id, :city, :address, :building, :phone_no, :user_id, :item_id, :token

  with_options presence: true do
    validates :zip, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフンを挟んだ半角数字で入力してください' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :city
    validates :address
    validates :phone_no, numericality: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }, length: { maximum: 11 }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zip: zip, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_no: phone_no,
                   order_id: order.id)
  end
end
