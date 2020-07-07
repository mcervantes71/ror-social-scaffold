class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(friend_id: params[:user_id])
    @friendship.user_id = current_user.id
    @friendship.confirmed = false

    if @friendship.save
      redirect_to users_path, notice: 'Friend request successfully.'
    else
      redirect_to users_path, alert: @friendship.errors.full_messages.join('. ').to_s
    end
  end

  def update
    @friendship = current_user.inverse_friendships.find_by(user_id: params[:user_id])
    @friendship.confirmed = true

    if @friendship.save
      redirect_to users_path, notice: 'Friend request Accepted.'
    else
      redirect_to users_path, alert: @friendship.errors.full_messages.join('. ').to_s
    end
  end

  def destroy
    @friendship = current_user.friendships.find_by(friend_id: params[:user_id])
    @friendship ||= current_user.inverse_friendships.find_by(user_id: params[:user_id])

    Friendship.destroy(@friendship.id)

    redirect_to users_path, notice: 'Friend Deleted.'
  end
end