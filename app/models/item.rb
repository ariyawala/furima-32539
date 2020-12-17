class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture

  with_options presence: true, numericality: { other_than: 1 }
    validates :category_id
    validates :condition
    validates :shipping_charge
    validates :prefecture
  end
end
