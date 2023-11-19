require 'rails_helper'

RSpec.describe 'UserSessions', type: :system do
  describe 'ログイン前' do
    context 'フォームの入力値が未入力' do
      it 'ログイン処理が失敗' do
        visit login_path
        click_button 'ログイン'
        expect(page).to have_content 'ログインに失敗しました'
        expect(current_path).to eq login_path
      end
    end

    context 'emailのフォーム値が異常' do
      let(:user) { create(:user) }
      it 'ログイン処理が失敗' do
        visit login_path
        fill_in 'email', with: 'wrong@example.com'
        fill_in 'password', with: 'password'
        click_button 'ログイン'
        expect(page).to have_content 'ログインに失敗しました'
        expect(current_path).to eq login_path
      end
    end

    context 'passwordのフォーム値が異常' do
      let(:user) { create(:user) }
      it 'ログイン処理が失敗' do
        visit login_path
        fill_in 'email', with: user.email
        fill_in 'password', with: 'wrong_password'
        click_button 'ログイン'
        expect(page).to have_content 'ログインに失敗しました'
        expect(current_path).to eq login_path
      end
    end

    context 'フォーム値が正常' do
      let(:user) { create(:user) }
      it 'ログイン処理が成功' do
        login(user)
        expect(page).to have_content 'ログインに成功しました'
        expect(current_path).to eq root_path
      end
    end
  end
end
