class Item < ApplicationRecord
  belongs_to       :user
  has_one_attached :image
  has_one          :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'が登録できません' }
    validates :info, length: { maximum: 1000 }
    validates :category_id
    validates :sales_status_id, numericality: { other_than: 0, message: "を入力してください" }
    validates :shipping_fee_status_id, numericality: { other_than: 0, message: "を入力してください" }
    validates :prefecture_id, numericality: { other_than: 0, message: "を入力してください" }
    validates :scheduled_delivery_id, numericality: { other_than: 0, message: "を入力してください" }
    validates :image
  end
end
