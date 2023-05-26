require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '全ての情報が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicnameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '1a1a1'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'passwordが全角文字を含んでいると登録できない' do
        @user.password = 'aaa11あ'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '1a1a1a'
        @user.password_confirmation = 'b2b2b2'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが数字では登録できない' do
        @user.last_name = 'あ1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters')
      end
      it 'last_nameが英字では登録できない' do
        @user.last_name = 'あa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters')
      end
      it 'last_nameが半角カナでは登録できない' do
        @user.last_name = 'あｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが数字では登録できない' do
        @user.first_name = 'あ1'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters')
      end
      it 'first_nameが英字では登録できない' do
        @user.first_name = 'あa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters')
      end
      it 'first_nameが半角カナでは登録できない' do
        @user.first_name = 'あｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters')
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'last_name_kanaが数字では登録できない' do
        @user.last_name_kana = 'ア1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
      end
      it 'last_name_kanaが英字では登録できない' do
        @user.last_name_kana = 'アa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
      end
      it 'last_name_kanaが半角カナでは登録できない' do
        @user.last_name_kana = 'アｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
      end
      it 'last_name_kanaがひらがなでは登録できない' do
        @user.last_name_kana = 'アあ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
      end
      it 'last_name_kanaが漢字では登録できない' do
        @user.last_name_kana = 'ア亜'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaが数字では登録できない' do
        @user.first_name_kana = 'ア1'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters')
      end
      it 'first_name_kanaが英字では登録できない' do
        @user.first_name_kana = 'アa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters')
      end
      it 'first_name_kanaが半角カナでは登録できない' do
        @user.first_name_kana = 'アｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters')
      end
      it 'first_name_kanaがひらがなでは登録できない' do
        @user.first_name_kana = 'アあ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters')
      end
      it 'first_name_kanaが漢字では登録できない' do
        @user.first_name_kana = 'ア亜'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
