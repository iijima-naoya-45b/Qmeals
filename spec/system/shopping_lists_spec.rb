require 'rails_helper'

RSpec.describe 'ShoppingLists', type: :system do
  let!(:user) { create(:user) }
  let(:shopping_list) { build(:shopping_list) }

  describe 'ログイン前検証' do
    describe 'ページ遷移確認' do
      context 'お買い物リスト一覧へ遷移' do
        it 'お買い物リストへの遷移が失敗する' do
          visit shop_lists_path
          expect(page).to have_content('ログイン')
          expect(current_path).to eq login_path
        end
      end

      context 'お買い物リスト編集へ遷移' do
        it 'お買い物リストへの遷移が失敗する' do
          visit edit_shop_list_path(1)
          expect(page).to have_content('ログイン')
          expect(current_path).to eq login_path
        end
      end
    end
  end

  describe 'ログイン後検証' do
    before do
      login(user)
    end

    context '商品・備考を打鍵した場合' do
      it '正常に登録されること' do
        visit shop_lists_path
        fill_in 'shopping_list[item]', with: shopping_list.item
        fill_in 'shopping_list[notes]', with: shopping_list.notes
        click_button '追加'
        expect(page).to have_content 'お買い物リストを作成しました'
        expect(current_path).to eq shop_lists_path
      end
    end

    context '商品のみを打鍵した場合' do
      it '正常に登録されること' do
        visit shop_lists_path
        fill_in 'shopping_list[item]', with: shopping_list.item
        fill_in 'shopping_list[notes]', with: ''
        click_button '追加'
        expect(page).to have_content 'お買い物リストを作成しました'
        expect(current_path).to eq shop_lists_path
      end
    end

    context '備考のみを打鍵した場合' do
      it 'エラーが出ること' do
        visit shop_lists_path
        fill_in 'shopping_list[item]', with: ''
        fill_in 'shopping_list[notes]', with: shopping_list.notes
        click_button '追加'
        expect(page).to have_content 'お買い物リストを作成出来ませんでした'
        expect(current_path).to eq shop_lists_path
      end
    end
  end
end
