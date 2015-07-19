class StoreInfoRatingsController < ApplicationController
    def create
        @store_info = StoreInfo.find(params[:store_info_id])
        
        @store_info_rating_params = store_info_rating_params
        @store_info_rating_params["user_id"] = current_user.id
        @rating = @store_info.store_info_ratings.create(@store_info_rating_params)
        redirect_to store_info_path(@store_info)
    end

    def destroy
        # render plain: params.inspect
        @store_info = StoreInfo.find(params[:store_info_id])
        @store_info_rating = @store_info.store_info_ratings.find(params[:id])
        
        @store_info_rating.destroy
        redirect_to store_info_path(@store_info)
    end

    private
        def store_info_rating_params
            params.require(:store_info_rating).permit(:store_info_id, :user_id, :rating, :comment)
        end
end
