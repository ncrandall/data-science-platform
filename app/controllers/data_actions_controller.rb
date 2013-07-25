class DataActionsController < ApplicationController

  def create
    @data_action = current_user.data_actions.build(data_action_params)

    if @data_action.save
      flash[:success] = "Successfully shown work!"
      redirect_to @data_action.repo
    else
      flash[:error] = "There was a problem showing your work."
      render 'new'
    end
  end

  def destroy
    @data_action = current_user.data_actions.where(id: params[:id]).first

    if @data_action.destroy
      flash[:success] = "Successfully deleted work!"
    else
      flash[:error] = "There was a problem deleting work."
    end

    redirect_to repo_path(@data_action.repo.id)
  end

  private

  def data_action_params
    params.require(:data_action).permit(:description, :url, :repo_id)
  end
end
