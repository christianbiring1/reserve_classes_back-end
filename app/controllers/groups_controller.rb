require 'json'

class GroupsController < ApplicationController



  before_action :set_group, only: %i[show destroy]
  before_action :group_params, only: %i[create]

  # GET /class
  def index
    @groups = Group.all
    render json: @groups
  end

  def show
    render json: Group.find(@group.id)
  end

  def create
    group = @current_user.groups.new(goup_params)


    if group.save
      render json: group, status: :created, location: group
    else
      render json: group.errors, status: :unprocessable_entity
    end
  end

  # DELETE 
  def destroy
    @group.destroy
    render json: 'Class Deleted Successfully'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.permit(:name,:title, :description, :rating, :image,:user_id, :location)
  end

 
end
