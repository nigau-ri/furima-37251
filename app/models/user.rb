class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders
  has_many :comments

  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'が登録できません。全角で入力してください。' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'が登録できません。全角で入力してください。' }
    validates :last_name_kana,
              format: { with: /\A[ァ-ヶ一]+\z/, message: 'が登録できません。全角カタカナで入力してください。' }
    validates :first_name_kana,
              format: { with: /\A[ァ-ヶ一]+\z/, message: 'が登録できません。全角カタカナで入力してください。' }
    validates :birth_date
  end
  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i,
                      message: 'が登録できません。半角英数で入力してください。数字とアルファベット両方を含む必要があります。' }
end
