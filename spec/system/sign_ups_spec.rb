require 'rails_helper'

RSpec.describe 'SignUps', type: :system do
  describe 'errorサインアップ検証' do
    context 'フォーム未入力の場合' do
      let(:user) { create(:user) }
      it 'サインアップが失敗' do
        visit new_user_path
        click_button '登録'
        expect(page).to have_content 'ユーザーを作成出来ませんでした'
        expect(current_path).to eq new_user_path
      end
    end

    context 'nameが未入力の場合' do
      let(:user) { create(:user) }
      it 'サインアップが失敗' do
        visit new_user_path
        fill_in 'user[name]', with: ''
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        fill_in 'user[password_confirmation]', with: user.password_confirmation
        click_button '登録'
        expect(page).to have_content '名前 3文字以上で入力してください'
        expect(current_path).to eq new_user_path
      end
    end

    context 'emailが同じの場合' do
      let(:user) { create(:user) }
      it 'サインアップが失敗' do
        visit new_user_path
        fill_in 'user[name]', with: user.name
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        fill_in 'user[password_confirmation]', with: user.password_confirmation
        click_button '登録'
        expect(page).to have_content 'このメールアドレスは使用できません'
        expect(current_path).to eq new_user_path
      end
    end

    context 'emailが未入力の場' do
      let(:user) { create(:user) }
      it 'サインアップが失敗' do
        visit new_user_path
        fill_in 'user[name]', with: user.name
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: user.password
        fill_in 'user[password_confirmation]', with: user.password_confirmation
        click_button '登録'
        expect(page).to have_content 'メールアドレス 入力してください'
        expect(current_path).to eq new_user_path
      end
    end

    context '全て合致する場合' do
      let(:success_user) { build(:user) }
      it 'サインアップが成功' do
        visit new_user_path
        fill_in 'user[name]', with: success_user.name
        fill_in 'user[email]', with: success_user.email
        fill_in 'user[password]', with: success_user.password
        fill_in 'user[password_confirmation]', with: success_user.password_confirmation
        click_button '登録'
        expect(page).to have_content 'ユーザー登録に成功しました'
        expect(current_path).to eq login_path
      end
    end
  end
end
