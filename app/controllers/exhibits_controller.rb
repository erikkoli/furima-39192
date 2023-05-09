class ExhibitsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @exhibits = Exhibit.order('created_at DESC')
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

  private

  def exhibit_params
    params.require(:exhibit).permit(:product, :explain, :price, :category_id, :condition_id, :postage_id, :prefecture_id,
                                    :shipment_id, :image).merge(user_id: current_user.id)
  end
end
