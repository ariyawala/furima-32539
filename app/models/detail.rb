class Detail < ApplicationRecord
  belongs_to :user, optional: true
  validates :age, presence: true
end 
