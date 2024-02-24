class User::HomesController < ApplicationController
  before_action :authenticate_user!
  def top
    render 'admin/homes/top'
  end
end
