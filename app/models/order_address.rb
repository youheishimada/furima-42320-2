class OrderAddress
  include ActiveModel::Model
   attr_accessor :post_code, :prefecture_id, :city, :address, :building,
                :phone_number, :user_id, :item_id, :token

  # バリデーション
  with_options presence: true do
    validates :token
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'は「3桁ハイフン4桁」の形式で入力してください' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁以上11桁以内の数字で入力してください' }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create!(user_id: user_id, item_id: item_id)
    Address.create!(
      post_code: post_code,
      prefecture_id: prefecture_id,
      city: city,
      address: address,
      building: building,
      phone_number: phone_number,
      order_id: order.id
    )
  end

    
 end