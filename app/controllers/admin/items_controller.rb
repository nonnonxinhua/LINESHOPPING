class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
  if @item.update(item_params)
    redirect_to admin_items_path
  else
    render :edit
  end
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
