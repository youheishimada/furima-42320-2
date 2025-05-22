class Item < ApplicationRecord
  belongs_to :user
   has_one_attached :image  # 画像1枚

    # ActiveHashとのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :area
  belongs_to :shipping_day

  # バリデーション
  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :area_id
    validates :shipping_day_id
    validates :price
    validates :image
  end

  validates :category_id, :status_id, :shipping_fee_id, :area_id, :shipping_day_id,
            numericality: { other_than: 1, message: "can't be blank" }

  validates :price, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999
  }
end
