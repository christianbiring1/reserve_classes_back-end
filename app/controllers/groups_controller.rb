class GroupsController < ApplicationController
  def index
    groups = Group.all
    render json: groups
  end

  def show
    group = Group.find(params[:id])
    render json: group
  end

  def create
    group = @current_user.groups.new(groups_params)
    if group.save
      render json: group, status: :created
    else
      render json: group.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    render json: 'The class has been deleted successfully!'
  end

  private

  def groups_params
    params.require(:group).permit(:name, :description, :rating, :title)
  end
end
