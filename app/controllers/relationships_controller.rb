class RelationshipsController < ApplicationController

  def create
    @friend = User.find(params[:friend_id])
    @relationship = current_user.relationships.build(friend_id: @friend.id)

    if @relationship.save
      flash[:notice] = "You're now following #{@friend.username}"
      redirect_to profile_path(@friend.id)
    else
      flash[:alert] = "Something went wrong."
      redirect_to profile_path(@friend.id)
    end
  end

  def destroy
    @relationship = current_user.relationships.find(params[:id])
    @friend = User.find(params[:id])

    if @relationship.destroy
      flash[:notice] = "No longer following"
      redirect_to profile_path(current_user.id)
    else
      flash[:alert] = "Something went wrong"
      redirect_to profile_path(@friend.id)
    end
  end
end
