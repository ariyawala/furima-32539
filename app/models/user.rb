class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は6文字以上で半角英数字をそれぞれ含めてください" }
  with_options presence: true, format: { with: /\A[ぁ-ゔァ-ヴ-龥々]+\z/, message: 'に全角文字を使用してください' } do
    validates :last_name
    validates :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヴ]+\z/, message: 'に全角カナを使用してください' } do
    validates :last_name_kana
    validates :first_name_kana
  end
  validates :birthday, presence: true


end
