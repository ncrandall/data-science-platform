class FavoritesController < ApplicationController

  def create
    @favorite = current_user.favorites.create(favorite_params)

    respond_to :js
  end

  def destroy
    @favorite = current_user.favorites.where(id: params[:id]).first.destroy

    respond_to :js
  end

  private

  def favorite_params
    params.require(:favorite).permit(:data_action_id)
  end
end
