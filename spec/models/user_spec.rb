require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_kanaとfirst_name_kana、birth_dateが存在すれば登録できる' do
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
      end
      it 'emailが空では登録できない' do
      end
      it 'passwordが空では登録できない' do
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
      end
      it 'last_nameが空では登録できない' do
      end
      it 'first_nameが空では登録できない' do
      end
      it 'last_name_kanaが空では登録できない' do
      end
      it 'first_name_kanaが空では登録できない' do
      end
      it 'birth_dateが空では登録できない' do
      end
      it '重複したemailが存在する場合は登録できない' do
      end
      it 'emailは@を含まないと登録できない' do
      end
      it 'passwordが5文字以下では登録できない' do
      end
      it 'passwordが129文字以上では登録できない' do
      end
      it 'passwordは英字と数字の両方を含まないと登録できない' do
      end
      it 'last_nameが全角文字じゃないと登録できない' do
      end
      it 'first_nameが全角文字じゃないと登録できない' do
      end
      it 'last_name_kanaが全角カナじゃないと登録できない' do
      end
      it 'first_name_kanaが全角カナじゃないと登録できない' do
      end
    end
  end
end
