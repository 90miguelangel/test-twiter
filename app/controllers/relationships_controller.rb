class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    relationship = current_user.following.create(relationship_params)
    if relationship.errors.any?
      render json: relationship.errors, status: :unprocessable_entity
    else
      render json: relationship, status: :created
    end
  end

  def destroy
    relationship = Relationship.find(params[:id])
    relationship.destroy
    if relationship.errors.any?
      render json: relationship.errors, status: :unprocessable_entity
    else
      render json: {}, status: :no_content
    end
  end

  private

  def relationship_params
    params.require(:relationship).permit(:user_id)
  end
end
