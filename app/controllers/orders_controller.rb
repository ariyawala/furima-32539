class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :detect_item, only: [:index, :create]

  def index
    @purchase = Purchase.new
    redirect_to root_path if @item.order.present? || @item.user_id == current_user.id
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def detect_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase).permit(:zip, :prefecture_id, :city, :address, :building, :phone_no).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
