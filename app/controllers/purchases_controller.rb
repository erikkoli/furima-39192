class PurchasesController < ApplicationController
  def index
    @exhibit = Exhibit.find(params[:exhibit_id])
  end

  def create
    @purchase_address = PurchaseAddress.new
  end
end
