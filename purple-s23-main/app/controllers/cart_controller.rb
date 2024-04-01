class CartController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @userdata = Userdatum.find_by(user_id: @user.id)
    @cart = Usercart.find_or_create_by(userdata_id: @userdata.id)
    @cartitems = UserCartItem.where(usercart_id: @cart.id)
    @total_order_value = 0
    for item in @cartitems
        @total_order_value = @total_order_value + (item.price_cents * item.quantities)
    end
    render  :index
end

def delete
    @cartitem = UserCartItem.find(params[:id])  
    if @cartitem.delete
        flash[:notice] = 'Item deleted successfully'
    else
        flash[:error] = 'Item deletion failed'
    end
    redirect_to cart_items_path
end

def create_delivery_profile
    @user = User.find(current_user.id)
    @userdata = Userdatum.find_by(user_id: @user.id)
    @cart = Usercart.find_or_create_by(userdata_id: @userdata.id)
    @cartitems = UserCartItem.where(usercart_id: @cart.id)
    @total_order_value = 0
    for item in @cartitems
        @total_order_value = @total_order_value + (item.price_cents * item.quantities)
    end
    if params[:input_box].present?
        flash[:notice] = params[:input_box]
        @dp = DeliveryProfile.create(profile_name: params[:input_box], price_cents: @total_order_value, userdata: @userdata)
        for item in @cartitems
            @dpi = DeliveryProfileItem.create(price_cents: item.price_cents, quantity: item.quantities, salad_name: item.salad_name, salad_id: item.salad_id, delivery_profiles: @dp)
            @dpi.save
        end
        redirect_to delivery_profiles_path
    else
        flash[:error] = 'Delivery Profile empty'
        render :index, status: :unprocessable_entity
    end
  end  
  
end