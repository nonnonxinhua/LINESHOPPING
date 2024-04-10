class Admin::CartItemsController < ApplicationController

 before_action :set_person, only: [:index, :destroy, :destroy_all, :create, ]
  def index
   @cart_items = @person.cart_items
   @total = 0
  end

  def show

  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to admin_cart_items_path
  end

  def destroy
   @cart_item = @person.cart_items.find(params[:id])
   @cart_item.destroy
   redirect_to admin_cart_items_path
  end

  def destroy_all
   @cart_items = @person.cart_items
   @cart_items.destroy_all
    redirect_to admin_cart_items_path
  end

  def create

    @cart_item=CartItem.new(cart_item_params)
    if admin_signed_in?
     @cart_item.admin_id= @person.id
    else 
     @cart_item.user_id=@person.id
    end

    @item= Item.find(params[:cart_item][:item_id])
    if @item.present?
     # 被りがあった場合の処理

     @cart_item.update_attribute(:amount,params[:cart_item][:amount])
    elsif Item.find(params[:cart_item][:item_id]).is_active == false

    else
     # 被りがなかった場合の処理
      @cart_item.save
    end

    redirect_to  admin_cart_items_path


  end

   private
    def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
    end

  def set_person
   @person = current_admin || current_user
  end

end