require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができるとき' do
      it 'email, password, passwrod-confirmation, nickname, family_name, first_name, kana_family_name, kana_first_nameが存在すれば新規登録できる。' do
        expect(@user).to be_valid
      end
    end
    context '新規登録ができないとき' do
      it 'メールアドレスがないと新規登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email can't be blank")
      end
      it 'メールアドレスが一意性である' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include ("Email has already been taken")

      end
      it 'メールアドレスは、@を含む必要がある' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email is invalid")
      end
      it 'パスワードが必須である' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password can't be blank")
      end
      it 'パスワードは、6文字以上での入力が必須である' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)")
      end
      it 'パスワードとパスワード（確認）は、値の一致が必須である' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
      end
    end
  end
end
