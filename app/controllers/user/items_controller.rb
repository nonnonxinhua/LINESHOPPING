class User::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def edit
  end

  def update
  end

  def index
   @items = Item.all.page(params[:page])
  end

  def show
     @item = Item.find(params[:id])
     @cart_item =CartItem.new
  end

   private
  # ストロングパラメータ
  def item_params
    params.require(:item).permit(:image, :name,:introduction,:genre_id,:price,:is_active,)
  end

end
