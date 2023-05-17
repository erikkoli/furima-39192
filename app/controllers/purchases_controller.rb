class PurchasesController < ApplicationController
  before_action :set_exhibit, only: [:index, :create]
  before_action :contributor_confirmation, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id, exhibit_id: @exhibit.id)
  end

  def set_exhibit
    @exhibit = Exhibit.find(params[:exhibit_id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user =! @exhibit.user
  end
end
