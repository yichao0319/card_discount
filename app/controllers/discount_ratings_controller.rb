class DiscountRatingsController < ApplicationController
    def create
        @discount = Discount.find(params[:discount_id])
        # @user = Discount.find(params[:user_id])
        
        @discount_rating_params = discount_rating_params
        @discount_rating_params["user_id"] = current_user.id
        @rating = @discount.discount_ratings.create(@discount_rating_params)
        redirect_to discount_path(@discount)
    end

    def destroy
        # render plain: params.inspect
        @discount = Discount.find(params[:discount_id])
        @discount_rating = @discount.discount_ratings.find(params[:id])
        
        @discount_rating.destroy
        redirect_to discount_path(@discount)
    end

    private
        def discount_rating_params
            params.require(:discount_rating).permit(:discount_id, :user_id, :rating, :comment)
        end
end
