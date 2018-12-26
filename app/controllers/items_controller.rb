class ItemsController < ApplicationController

  def index
    @item = Item.order("RAND()")
    @items = Item.new
  end
  def new
    @item = Item.new
    4.times {@item.images.build}
    render :new, layout: "sub-layout"
  end

  def edit
    @item = Item.find(params[:id])
    render :new, layout: "sub-layout"
  end

  def update
    @item = Item.find(params[:id])
    @item.update(exhibit_params) if item.user.id == current_user
      redirect_to item_path(:id)
  end

  def show
  	@item = Item.find(params[:id])
    @user = @item.user
  end

  def create
    @item =Item.new(exhibit_params)
    @item.save
  end


  def destroy
    item = Item.find(params[:id])
    if item.user_id == current_user.id
      if item.destroy
        redirect_to root_path notice:'削除できました'
      else
        redirect_to root_path notice: 'エラーが発生しました。'
      end
    end
  end

  private
  def exhibit_params
    params[:item].permit(:name,:description,:condition_id,:postage_id,:delivery_method_id,:prefecture_id,:delivery_day_id,:price,:category_id,images_attributes:[:id,:image,]).merge(user_id:current_user.id)
  end
end



