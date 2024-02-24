class Admin::CustomersController < ApplicationController
  def index
     @customers = Customer.page(params[:page])
  end

  def show
  end

  def edit
  end

  def new
    @customer =Customer.new
  end
end
