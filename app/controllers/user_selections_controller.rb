class UserSelectionsController < ApplicationController
  before_filter :authorize

  def index
    @countries = Country.all
    @selections = current_user.user_selections
    @last_selection = @selections.last
  end

  def create
    object_params = user_selection_params.merge(user_id: current_user.id)
    us = UserSelection.create(object_params)
    if us.errors.any?
      flash[:error] = 'This timezone is already in your list.'
    end
    redirect_to '/'
  end


  private

  def user_selection_params
    params.require(:user_selection).permit(:user_id, :country_id, :region_id)
  end
end