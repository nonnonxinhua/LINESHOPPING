class Admin::CustomersController < ApplicationController
  def index
     @customers = Customer.page(params[:page])
  end

  def show
     @customers =Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def new
    @customer =Customer.new
  end

  def update
     @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
    else
    render :edit
    end
  end

   def create
     @customer = Customer.new(customer_params)
     @customer.save
     redirect_to admin_customers_path(@customer.id)
   end

   def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana, :first_name_kana,:postal_code,:address,:telphone_number,:is_deleted)
   end
end

