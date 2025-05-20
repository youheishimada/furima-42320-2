class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
         #氏名/ニックネーム バリデーション設定 
         validates :nickname, presence: true
         validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'は全角で入力してください' }
         validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'は全角で入力してください' }
         validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力してください' }
         validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力してください' }
        
         #生年月日 バリデーション設定
         validates :birthday, presence: true
        
        #メールアドレス バリデーション設定
         validates :email, presence: true, uniqueness: true
         validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'には@を含めてください' }
        
         #パスワード バリデーション設定
         validates :password, format: { 
                    with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, 
                    message: 'は英字と数字の両方を含めて設定してください' 
                                       }   
end
