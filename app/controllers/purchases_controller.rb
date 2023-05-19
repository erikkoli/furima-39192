class PurchasesController < ApplicationController
  before_action :set_exhibit, only: [:index, :create]
  before_action :contributor_confirmation, :buyer_confirmation, only: :index

  def index
    @purchase_address = PurchaseAddress.new
  end

  def new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id, exhibit_id: @exhibit.id, token: params[:token])
  end

  def set_exhibit
    @exhibit = Exhibit.find(params[:exhibit_id])
  end

  def contributor_confirmation
    redirect_to root_path if current_user == @exhibit.user
  end

  def buyer_confirmation
    @purchased_exhibits = Purchase.where(exhibit_id: @exhibit.id)
    redirect_to root_path if @purchased_exhibits.exists?
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @exhibit.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
