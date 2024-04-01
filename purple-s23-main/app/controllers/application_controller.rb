class ApplicationController < ActionController::Base
    rescue_from ActionController::RoutingError, with: :handle_routing_error
    include MoneyRails::ActionViewExtension
    def after_sign_in_path_for(resource)
        "/dashboard"
    end

    def page_routing
        if current_user.role === 'admin'
            redirect_to admin_curated_salads_url
        else
            if current_user.reg_done
                redirect_to curated_salads_url
            else
                redirect_to user_profile_url
            end
        end
    end

    def handle_routing_error
        redirect_to destroy_user_session_path
    end
end
