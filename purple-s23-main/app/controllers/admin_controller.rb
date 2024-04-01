class AdminController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin!

    def authorize_admin!
        if current_user.role != 'admin'
            flash[:alert] = "You are not authorized to access this resource."
            redirect_to login_url
        end
    end

    def index
        if request.get? && params[:commit].present? && params[:commit] === 'Clear'
            redirect_to admin_curated_salads_path(params.permit(:controller, :action))
        else
            @curatedsalads = CuratedSalad.all
            if params[:salads]
                params[:salads].each do |keyword|
                    @curatedsalads = @curatedsalads.where("\"#{keyword}\" is true")
                end
            end

            calorie_range = params[:calorie_range]
            if calorie_range.present? && calorie_range != "Select"
                min_calorie, max_calorie = calorie_range.split("-").map(&:to_i)
                if max_calorie == "+"
                    max_calorie = Float::INFINITY
                end
                @curatedsalads = @curatedsalads.where(calories: min_calorie..max_calorie)
            end
            @curatedsalads = @curatedsalads.order("updated_at DESC")
            render  :index
        end
    end

    def new
        @curatedsalad=CuratedSalad.new
        render :new
    end

    def create
        #@curatedsalad=CuratedSalad.find(params[:id])
        @curatedsalad=CuratedSalad.new(params.require(:curated_salad).permit(:saladName, :saladIngredients, :calories, :salad_image, :price_cents, :quantities, :discount))
        curatedsalad.salad_image = params[:salad_image] if params[:salad_image]
        
        if @curatedsalad.save
            flash[:success]=" Salad saved successfully"
            redirect_to admin_curated_salads_url(@curatedsalad)
        else 
            flash.now[:error]=" Salad could not be saved"
            render :new,status: :unprocessable_entity
        end
    end

    def edit
        @curatedsalad = CuratedSalad.find(params[:id])
        render :edit
    end

    def update
        @curatedsalad= CuratedSalad.find(params[:id])
        if @curatedsalad.update(params.require(:curated_salad).permit(:saladName, :saladIngredients, :calories, :salad_image, :price_cents, :quantities, :discount, :outOfStock))
            flash[:success] = 'Salad  successfully updated!'
            redirect_to admin_curated_salads_url(@curatedsalad)
          else
            flash.now[:error] = 'Salad  update failed'
            render :edit, status: :unprocessable_entity
        end
    end

    def delete
        @curatedsalad = CuratedSalad.find(params[:id])
        
        @curatedsalad.destroy
        if @curatedsalad.destroyed?
            flash[:success] = 'The Salad was successfully destroyed.'
            redirect_to admin_curated_salads_url, status: :see_other
        else
            flash[:notice] = 'Salad deletion failed'
            redirect_to admin_curated_salads_url, status: :see_other
        end
    end



end
