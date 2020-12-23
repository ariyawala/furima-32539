class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :dispatch_timing

  with_options presence: true, numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :dispatch_timing_id
  end

  with_options presence: true do
    validates :item_name
    validates :item_description
    validates :image
    validates :price
  end

  validates :price, numericality: { greater_than: 299, less_than: 10_000_000, message: 'Out of setting range' }
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
end
