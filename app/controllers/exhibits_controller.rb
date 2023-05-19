class ExhibitsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_exhibit, only: [:show, :edit, :update, :destroy]
  before_action :contributor_confirmation, :buyer_confirmation, only: [:edit, :update, :destroy]

  def index
    @exhibits = Exhibit.order('created_at DESC')
    @purchased_exhibits = Purchase.pluck(:exhibit_id)
  end

  def new
    @exhibit = Exhibit.new
  end

  def create
    @exhibit = Exhibit.new(exhibit_params)
    if @exhibit.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
    @purchased_exhibits = Purchase.where(exhibit_id: @exhibit.id)
  end

  def edit
  end

  def update
    if @exhibit.update(exhibit_params)
      redirect_to exhibit_path(@exhibit)
    else
      render :edit
    end
  end

  def destroy
    @exhibit.destroy
    redirect_to root_path
  end

  private

  def exhibit_params
    params.require(:exhibit).permit(:product, :explain, :price, :category_id, :condition_id, :postage_id, :prefecture_id,
                                    :shipment_id, :image).merge(user_id: current_user.id)
  end

  def set_exhibit
    @exhibit = Exhibit.find(params[:id])
  end

  def buyer_confirmation
    @purchased_exhibits = Purchase.where(exhibit_id: @exhibit.id)
    redirect_to root_path if @purchased_exhibits.exists?
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @exhibit.user
  end
end
