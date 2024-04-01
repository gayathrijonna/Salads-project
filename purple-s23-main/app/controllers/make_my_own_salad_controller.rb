class MakeMyOwnSaladController < ApplicationController
    before_action :authenticate_user!
    def index
        @ingredients=Ingredient.all
        @saladCreation = false;
        render  :index
    end

    def index_update
        @Ingredient.added
        if @Ingredient.added
            flash[:success] = 'The Salad was successfully added'
            redirect_to makemyownsalad_url, status: :see_other
        end
    end

    def curate_salad
        @ingredients=Ingredient.all
        @saladCreation = true;
        if params[:ingredients].present? && params[:salad_name].present?
            @selected_ingredients = Ingredient.where(id: params[:ingredients])
            @saladName = params[:salad_name]
            @iString = ''
            @iCalories = 0
            for item in @selected_ingredients
                @iString = @iString + "  " + item.iname
                @iCalories = @iCalories + item.icalorie
            end
            @curatedsalad = CuratedSalad.find_or_create_by(saladName: @saladName, saladIngredients: @iString, calories:@iCalories.to_i, price_cents: 10.35, quantities: params[:quantity].to_i)
            if @curatedsalad.save 
                @user = User.find(current_user.id)
                @userdata = Userdatum.find_by(user_id: @user.id)
                @cart = Usercart.find_or_create_by(userdata: @userdata)
                @cartitem = UserCartItem.create(salad_name: @saladName, quantities: params[:quantity].to_i, price_cents: 10.98, usercart_id: @cart.id, salad_id: @curatedsalad.id)
                if @cart.save
                    if @cartitem.save
                         success = true
                         flash[:success] = 'Added to cart'
                         render :index, status: :unprocessable_entity
                    else
                         flash[:error] = 'Cart Item update failed'
                         render :index, status: :unprocessable_entity
                    end
                 else
                     flash[:error] = 'Cart update failed'
                     render :index, status: :unprocessable_entity
                 end
            else
                flash[:error] = 'Salad not added!!!'
                render :index, status: :unprocessable_entity
            end
        else
            flash[:error] = 'Salad name is needed!!!'
            render :index, status: :unprocessable_entity
        end
    end

    def promote_salad
        @ingredients=Ingredient.all
        @saladCreation = true;
        @curatedsalad = CuratedSalad.find(params[:id])
        @post = Post.new(:title => @curatedsalad.saladName, :content => @curatedsalad.saladIngredients, :likes => 0, :dislikes => 0)
        if @post.save
            flash[:success] = 'Salad Promoted'
            render :index
        else
            flash[:error] = 'Salad promotion is failed!!!'
            render :index, status: :unprocessable_entity
        end
    end
end