class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address,
                :building, :phone_number, :token, :user_id, :item_id

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :postal_code, presence: true,
                          format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は3桁ハイフン4桁半角文字列のみ入力可能です' }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true,
                           format: { with: /\A[0-9]{10,11}\z/, message: 'は10桁以上11桁以内の半角数値のみ入力可能です' }
  validates :token, presence: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id,
                           city: city, address: address, building: building,
                           phone_number: phone_number, order_id: order.id)
  end
end
