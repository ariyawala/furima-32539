class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,        presence: true
  validates :last_name,       presence: true
  validates :first_name,      presence: true
  validates :last_name_kana,  presence: true
  validates :first_name_kana, presence: true
  validates :birthday,        presence: true



  t.string :nickname,           null: false
  t.string :last_name,          null: false
  t.string :first_name,         null: false
  t.string :last_name_kana,     null: false
  t.string :first_name_kana,    null: false
  t.date :birthday,             null: false

end
