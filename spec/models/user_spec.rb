require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションチェック' do
    it '設定したすべてのバリデーションが機能しているか' do
      user = build(:user)
      expect(user).to be_valid
      expect(user.errors).to be_empty
    end

    it 'name無しの場合、invalidになるか' do
      user_without_name = build(:user, name: "")
      expect(user_without_name).to be_invalid
      expect(user_without_name.errors[:name]).to eq ["入力してください", "3文字以上で入力してください"]
    end

    it 'password無しの場合、invalidになるか' do
      user_without_password = build(:user, password: "")
      expect(user_without_password).to be_invalid
      expect(user_without_password.errors[:password]).to eq ["3文字以上で入力してください"]
    end

    it 'password_confirmation無しの場合、invalidになるか' do
      user_without_password_confirmation = build(:user, password_confirmation: "")
      expect(user_without_password_confirmation).to be_invalid
      expect(user_without_password_confirmation.errors[:password_confirmation]).to eq ["パスワードとパスワード確認が違います", "入力してください"]
    end

    it 'email無しの場合、invalidになるか' do
      user_without_email = build(:user, email: "")
      expect(user_without_email).to be_invalid
      expect(user_without_email.errors[:email]).to eq ["入力してください", "このメールアドレスは使用できません"]
    end
  end
end
