require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(
      nickname: "Taro",
      email: "test@example.com",
      password: "abc123",
      password_confirmation: "abc123",
      last_name: "山田",
      first_name: "太郎",
      last_name_kana: "ヤマダ",
      first_name_kana: "タロウ",
      birthday: "1990-01-01"
    )
  end

  describe 'ユーザー新規登録' do
    context '登録できるとき' do
      it 'すべての項目が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        expect(@user).to_not be_valid
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        expect(@user).to_not be_valid
      end

      it '重複したemailでは登録できない' do
        @user.save
        another_user = @user.dup
        another_user.email = @user.email
        expect(another_user).to_not be_valid
      end

      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'testexample.com'
        expect(@user).to_not be_valid
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        expect(@user).to_not be_valid
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a1b2'
        @user.password_confirmation = 'a1b2'
        expect(@user).to_not be_valid
      end

      it 'passwordが英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        expect(@user).to_not be_valid
      end

      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        expect(@user).to_not be_valid
      end

      it 'passwordとpassword_confirmationが一致していないと登録できない' do
        @user.password_confirmation = 'different'
        expect(@user).to_not be_valid
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        expect(@user).to_not be_valid
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        expect(@user).to_not be_valid
      end

      it 'last_nameが全角以外では登録できない' do
        @user.last_name = 'yamada'
        expect(@user).to_not be_valid
      end

      it 'first_nameが全角以外では登録できない' do
        @user.first_name = 'taro'
        expect(@user).to_not be_valid
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        expect(@user).to_not be_valid
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        expect(@user).to_not be_valid
      end

      it 'last_name_kanaが全角カタカナ以外では登録できない' do
        @user.last_name_kana = 'やまだ'
        expect(@user).to_not be_valid
      end

      it 'first_name_kanaが全角カタカナ以外では登録できない' do
        @user.first_name_kana = 'たろう'
        expect(@user).to_not be_valid
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        expect(@user).to_not be_valid
      end
    end
  end
end