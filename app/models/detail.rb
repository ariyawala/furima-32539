class Detail < ApplicationRecord
  belongs_to :user, optional: true
  
  with_options presence: true do
    validates :age
    validates :gender_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :genre1_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :genre2_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :genre3_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :how_id, numericality: { other_than: 1, message: 'を選択してください' }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  belongs_to :genre1
  belongs_to :genre2
  belongs_to :genre3
  belongs_to :how
end 