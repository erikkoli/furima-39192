class UsersController < ApplicationController
  def show
    user = User.find(current_user.id)
    @exhibits = Exhibit.where(user_id: user.id)
    @purchased_exhibits = Purchase.pluck(:exhibit_id)
  end
end