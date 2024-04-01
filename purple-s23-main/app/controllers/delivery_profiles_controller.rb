class DeliveryProfilesController < ApplicationController
    before_action :authenticate_user!
    def index
        @userdata = Userdatum.find_by(user_id: current_user.id)
        @profiles = DeliveryProfile.all.where(userdata_id: @userdata.id)
        render  :index
    end

    def delete
        flash[:notice] = 'Profile delete'
        profile = DeliveryProfile.find_by(id: params[:id])
        items = DeliveryProfileItem.all().where(delivery_profiles_id: params[:id])
        if items.destroy_all
            if profile.delete
                flash[:notice] = 'Profile & Items deleted successfully'
            else
                flash[:notice] = 'Profile deletion failed but items was deleted successfully'
            end
        else
            flash[:notice] = 'Items deletion failed'
        end

        @userdata = Userdatum.find_by(user_id: current_user.id)
        @profiles = DeliveryProfile.all.where(userdata_id: @userdata.id)
        redirect_to delivery_profiles_path
    end

    def add_to_cart
        success = false
        @userdata = Userdatum.find_by(user_id:current_user.id)
        @cart = Usercart.find_or_create_by(userdata: @userdata)
        @items = DeliveryProfileItem.all().where(delivery_profiles_id: params[:id])
        for item in @items
            @salad = CuratedSalad.find(item.salad_id)
            @cartitem = UserCartItem.create(salad_name: item.salad_name, quantities: item.quantity, price_cents: item.price_cents, usercart: @cart, salad_id: item.salad_id)
            @salad.quantities = @salad.quantities - item.quantity
            if @salad.save
                if @cart.save
                   if @cartitem.save
                        success = true
                        flash[:success] = 'Added to cart'
                   else
                        flash[:error] = 'Cart Item update failed'
                   end
                else
                    flash[:error] = 'Cart update failed'
                end
            else
                flash[:error] = 'Failed to add ' + item.salad_name  + ' into cart and available quantities are ' + @salad.quantities.to_s
            end
        end
        
        if success === false
            flash[:success] = 'Not Added to cart'
        end
        
        @userdata = Userdatum.find_by(user_id: current_user.id)
        @profiles = DeliveryProfile.all.where(userdata_id: @userdata.id)
        redirect_to cart_items_path
    end
end