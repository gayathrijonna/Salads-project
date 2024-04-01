class CuratedSaladsController < ApplicationController
    before_action :authenticate_user!
    
    def home
        if request.get? && params[:commit].present? && params[:commit] === 'Clear'
            redirect_to curated_salads_path(params.permit(:controller, :action))
        else
            @salads = CuratedSalad.all
            if params[:query]
                keywords = params[:query].split
                keywords.each do |keyword|
                    @salads = @salads.where("\"saladName\" LIKE ? OR \"saladIngredients\" LIKE ?", "%#{keyword}%", "%#{keyword}%")
                end
            end

            if params[:salads]
                params[:salads].each do |keyword|
                    @salads = @salads.where("\"#{keyword}\" is true")
                end
            end

            calorie_range = params[:calorie_range]
            if calorie_range.present? && calorie_range != "Select"
                min_calorie, max_calorie = calorie_range.split("-").map(&:to_i)
                if max_calorie == "+"
                    max_calorie = Float::INFINITY
                end
                @salads = @salads.where(calories: min_calorie..max_calorie)
            end

            sort_index = params[:sort_index]
            if sort_index.present? && sort_index != "Select"
                sort_value = params[:sort_index].downcase
                    case sort_value
                        when 'lowest price'
                            @salads = @salads.order("price_cents ASC")
                        when 'highest price'
                            @salads = @salads.order("price_cents DESC")
                        when 'lowest cal'
                            @salads = @salads.order("calories ASC")
                        when 'highest cal'
                            @salads = @salads.order("calories DESC")
                        else
                            @salads = @salads.order(saladName:)
                    end
            end

            render  :salads
        end
    end

    def nutritions
        render partial: 'shared/nutritional-info'
    end

    def add_to_cart
        salad = CuratedSalad.find(params[:id])
        user = User.find(current_user.id)
        userdata = Userdatum.find_by(user_id: user.id)
        cart = Usercart.find_or_create_by(userdata: @userdata)
        cartitem = UserCartItem.create(salad_name: salad.saladName, quantities: params[:quantity].to_i, 
        price_cents: salad.price_cents * (1 - salad.discount), usercart: cart)
        salad.quantities = salad.quantities - params[:quantity].to_i
        if salad.save
            cart.save
            cartitem.save
            flash[:success] = 'Added to cart'
        else
            flash[:error] = 'Failed to add into cart and available quantities are ' + @salad.quantities.to_s
        end
        redirect_to curated_salads_path
    end

    def recommend
        @userdata = Userdatum.find_by(user_id: current_user.id)
        @uservitals = UserVitalsAndPreference.find_by(userdata_id: @userdata.id)
        gender = @uservitals.gender # 'male' #params[:gender]
        age = @uservitals.age #30 #params[:age].to_i
        present_weight = @uservitals.weight # 90 #params[:present_weight].to_i
        height = @uservitals.height # 172 #params[:height].to_i
        desired_weight = @uservitals.weighttobe # 78 #params[:desired_weight].to_i
        
        # Calculate BMR (Basal Metabolic Rate)
        if gender.downcase == "male"
        bmr = 88.362 + (13.397 * present_weight) + (4.799 * height) - (5.677 * age)
        elsif gender.downcase == "female"
        bmr = 447.593 + (9.247 * present_weight) + (3.098 * height) - (4.330 * age)
        end
        
        # Calculate TDEE (Total Daily Energy Expenditure) based on activity level
        tdee = bmr * 1.55 # For moderately active

        # when "sedentary"
        #     1.2
        #   when "lightly active"
        #     1.375
        #   when "moderately active"
        #      1.55
        #   when "very active"
        #     1.725
        #   when "extra active"
        #     1.9
        
        # Calculate daily calorie deficit required to achieve desired weight loss in 3 months
        daily_calorie_deficit = ((present_weight - desired_weight) / 3.0) * 7700 / 90.0
        
        # Calculate recommended calorie intake per meal
        calorie_intake_per_meal = (tdee - daily_calorie_deficit) / 3 / 4
    end

    def recommend_salads
        @salads = CuratedSalad.all
        if params[:query]
            keywords = params[:query].split
            keywords.each do |keyword|
                @salads = @salads.where("\"saladName\" LIKE ? OR \"saladIngredients\" LIKE ?", "%#{keyword}%", "%#{keyword}%")
            end
        end

        if params[:salads]
            params[:salads].each do |keyword|
                @salads = @salads.where("\"#{keyword}\" is true")
            end
        end

        calorie = recommend()
        @salads = @salads.where(calories: 0..calorie)
        flash[:notice] = 'Recommended salads loaded with recommended calorie intake per meal as ' + calorie.to_s
        render  :salads
    end
end
