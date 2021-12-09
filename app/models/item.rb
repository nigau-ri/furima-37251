class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  has_one_attached :image

  with_options presence: true do
    validates :name 
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'is invalid'}
    validates :info
    validates :category_id            , numericality: {other_than: 0, message: "can't be blank"}
    validates :sales_status_id        , numericality: {other_than: 0, message: "can't be blank"}
    validates :shipping_fee_status_id , numericality: {other_than: 0, message: "can't be blank"}
    validates :prefecture_id          , numericality: {other_than: 0, message: "can't be blank"}
    validates :scheduled_delivery_id  , numericality: {other_than: 0, message: "can't be blank"}
  end
end
