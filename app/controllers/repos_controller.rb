class ReposController < ApplicationController
  before_filter :authenticate_user!

  def index
    @repos = Repo.all
  end

  def show
    @repo = Repo.where(id: params[:id]).first
  end

  def new
    @repo = Repo.new
  end

  def create
    @repo = current_user.repos.build(repo_params)

    if @repo.save
      flash[:success] = "Successfully created repo"
      redirect_to @repo
    else
      flash[:error] = "Error creating repo"
      render 'new'
    end
  end

  def edit
    @repo = current_user.repos.where(id: params[:id]).first
  end

  def update
    @repo = current_user.repos.where(id: params[:id]).first

    if @repo.update_attributes(repo_params)
      flash[:success] = "Repo updated successfully"
      redirect_to @repo
    else
      flash[:error] = "There was an error updating the repo"
      render 'edit'
    end
  end

  def destroy
    @repo = current_user.repos.where(id: params[:id]).first

    if @repo.destroy
      flash[:success] = "successfully deleted the repo"
    else
      flash[:error] = "Error deleting repo"
    end

    redirect_to repos_path
  end

  private
  
  def repo_params
    params.require(:repo).permit(:name, :description, :schema, :size, :num_rows, :public)
  end

end
