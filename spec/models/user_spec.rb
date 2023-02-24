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
      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email can't be blank")
      end
      it '重複したメールアドレスは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include ("Email has already been taken")
      end
      it 'メールアドレスに@を含まない場合は登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email is invalid")
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password can't be blank")
      end
      it 'パスワードが6文字未満では登録できない' do
        @user.password = '123a'
        @user.password_confirmation = '123a'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)")
      end
      it 'パスワードとパスワード（確認用）が不一致だと登録できない' do
        @user.password = 'a123456'
        @user.password_confirmation = 'a1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is invalid")
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = 'asdfgh'
        @user.password_confirmation = 'asdfgh'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is invalid")
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = "アイウエオ"
        @user.password_confirmation = "アイウエオ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it '姓（全角）が空だと登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.family_name = 'Hoge'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Family name is invalid")
      end
      it '名（全角）が空だと登録できない' do 
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name can't be blank")
      end
      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.first_name = 'Hoge'
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name is invalid")
      end
      it '姓（カナ）が空だと登録できない' do
        @user.kana_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana family name can't be blank")
      end
      it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.kana_family_name = 'ほげ'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Kana family name is invalid")
      end
      it '名（カナ）が空だと登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Kana first name can't be blank")
      end
      it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.kana_first_name = 'ほげ'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Kana first name is invalid")
      end
      it '生年月日が空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
