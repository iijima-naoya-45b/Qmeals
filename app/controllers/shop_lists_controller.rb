# お買い物リストのコントローラ
class ShopListsController < ApplicationController
  before_action :set_shoppinglist, only: %i[edit update destroy]

  def index
    @shoppinglists = current_user.shopping_lists.all.order(created_at: :desc)
    @shoppinglist = ShoppingList.new
  end

  def create
    @shoppinglist = ShoppingList.new(shoppinglist_params)
    if @shoppinglist.save
      redirect_to shop_lists_path, success: '追加しました'
    else
      flash.now[:danger] = t('defaults.flash_message.not_created', item: ShoppingList.model_name.human)
      render :index, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @shoppinglist.update(shoppinglist_params)
      redirect_to shop_lists_path, success: '更新が完了しました。'
    else
      flash.now[:alert] = '追加に失敗しました'
      render :edit
    end
  end

  def destroy
    if @shoppinglist.destroy
      redirect_to shop_lists_path, success: '削除が完了しました。'
    else
      redirect_to shop_lists_path, status: :see_other, danger: '削除が失敗しました。'
    end
  end

  private

  def set_shoppinglist
    @shoppinglist = ShoppingList.find(params[:id])
  end

  def shoppinglist_params
    params.require(:shopping_list).permit(:item, :notes).merge(user_id: current_user.id)
  end
end
