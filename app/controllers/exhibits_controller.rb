class ExhibitsController < ApplicationController
  before_action :authenticate_user!

  def index
    @exhibits = Exhibit.order("created_at DESC")
  end

  def new
    @exhibit = Exhibit.new
  end

  #def create
    #@exhibit = Exhibit.new(exhibit_params)
    #if @exhibit.save
      #redirect_to root_path
    #else
      #render :new
    #end
  #end

  private

  def exhibit_params
    params.require(:exhibit).permit(:product, :explain, :category_id)
  end
end
