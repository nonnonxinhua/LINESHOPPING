class User::Users::OrdersController < ApplicationController
  before_action :set_person, only: [:confirmation, :new, :create,]

 def new
   @customer = current_admin
   @order = Order.new
 end

 def create
   @order = Order.new(order_params)
  # @order.customer_id=current_customer.id
  # @order.address=current_customer.address
  # @order.postal_code=current_customer.postal_code
  # @order.name=current_customer.last_name+current_customer.first_name
   @order.save!
   @person.cart_items.each do |cart_item|
     @order_detail=OrderDetail.new
     @order_detail.order_id=@order.id
     @order_detail.item_id=cart_item.item_id
     @order_detail.price=cart_item.item.price
     @order_detail.amount=cart_item.amount
     @order_detail.save
     cart_item.destroy
   end
   redirect_to admin_orders_completion_path
 end


  def index
    @orders = Order.page(params[:page])
  end

  def completion

  end


  def show
   @order = Order.find(params[:id])
   @customer = @order.customer
   @order_details = @order.order_details
   @subtotal =0
   @shipping_cost =800
  end

  def confirmation
    customer = Customer.find(confirmation_params[:customer_id])
    @cart_items = @person.cart_items
    @order = Order.new(order_params)
    @order.postal_code=customer.postal_code
    @order.address=customer.address
    @order.name=customer.first_name+customer.last_name
    @order.customer_id=customer.id
    @shipping_cost = 800
    @subtotal = 0
  end

 private
  # ストロングパラメータ
  def order_params
    params.require(:order).permit(:is_active,:payment_method,:address,:total_payment,:postal_code,:customer_id,:name,:shipping_cost)
  end

  def confirmation_params
    params.require(:order).permit(:payment_method, :customer_id)
  end

  def set_person
   @person = current_admin || current_user
  end

end

