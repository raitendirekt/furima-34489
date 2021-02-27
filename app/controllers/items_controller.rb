class ItemsController < ApplicationController
  before_action :set_item, except: [:index :new, :create]
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :seller_confirmation, only: [:edit, :update, :destory]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :bear_shipping_id, :prefecture_id,
                                 :shipment_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def seller_confirmation
    redirect_to action: :index unless current_user.id == @item.user_id
  end
end
