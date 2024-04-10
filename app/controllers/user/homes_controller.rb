class User::HomesController < ApplicationController
  before_action :authenticate_user!
  def top
    render 'user/homes/top'
  end
end
