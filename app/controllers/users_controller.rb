class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @exhibits = Exhibit.where(user_id: @user.id)
    @purchased_exhibits = Purchase.pluck(:exhibit_id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :image, :introduce, :password, :password_confirmation)
  end

end