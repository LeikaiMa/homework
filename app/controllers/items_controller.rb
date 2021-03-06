class ItemsController < ApplicationController
  def index
  	@items = Item.all
  end

  def create
  	@item = Item.create!(params_item)

    respond_to do |format|
      format.html{redirect_to items_path, notice: "create a item successfully"}
      format.js
    end
  end
  

  def new
  	@item = Item.new
  end

  def show
  	@item = Item.find(params[:id])
  end

  def edit
  	@item = Item.find(params[:id])
  end

  def update
  	@item = Item.find(params[:id])
  	if @item.update(params_item)
  		flash[:notice] = "yes,updated!"
  		redirect_to edit_item_path # may be other url,hah..
  	else
  		flash[:alert] = "sorry..."
  		redirect_to edit_item_path
  	end
  end

  private
  	def params_item
  		params.require(:item).permit(:title, :description)
  	end
end
