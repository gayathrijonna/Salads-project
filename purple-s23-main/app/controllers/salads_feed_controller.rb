class SaladsFeedController < ApplicationController
    before_action :authenticate_user!
    def index
        @posts = Post.all.order(created_at: :asc)
        @likes = current_user.counter
        @dislikes = current_user.counter
        @comments = current_user.counter
        render   :index
    end

    def likes
        @likes=current_user.counter+1
        flash[:notice] = @likes
        current_user.counter = current_user.counter + 1
        if current_user.save
            flash[:notice] = 'Post liked'
        else
            flash[:error] = 'Error'
        end
        redirect_to salads_feed_path
    end

    def dislikes
        @dislikes=current_user.counter+1
        flash[:notice] = @dislikes
        current_user.counter = current_user.counter + 1
        if current_user.save
            flash[:notice] = 'Post disliked'
        else
            flash[:error] = 'Error'
        end
        redirect_to salads_feed_path
    end
end
