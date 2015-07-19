class DiscountsController < ApplicationController
    def new
        if current_user.nil? 
            redirect_to discounts_path
        end

        @discount = Discount.new
        # @discount_requirement_sets = DiscountRequirementSet.all
        # @discount_requirement_set = DiscountRequirementSet.new
        1.times do
            @discount_requirement_set = @discount.discount_requirement_sets.build
        end
        # render plain: @discount.discount_requirement_sets.empty?
    end

    def create
        @discount = Discount.new(discount_params)
        # render plain: params[:discount].inspect + "\n\n" + discount_params.inspect + "\n\n" + @discount.inspect

        if @discount.save
            redirect_to @discount
        else
            render 'new'
        end 
    end

    def show
        @discount = Discount.find(params[:id])
        # render plain: @discount.inspect + "\n\n" + @discount.group.inspect
    end

    def edit
        if current_user.nil?
            redirect_to discounts_path
        end

        @discount = Discount.find(params[:id])
        # @discount_requirement_sets = DiscountRequirementSet.all
    end

    def update
        @discount = Discount.find(params[:id])

        # render plain: discount_params.inspect + "\n\n" + params[:discount][:discount_requirement_sets_attributes].inspect

        if @discount.update(discount_params)
            redirect_to @discount
        else
            render 'edit'
        end
    end

    def index
        @discount = Discount.all
    end

    def destroy
        @discount = Discount.find(params[:id])
        @discount.destroy

        redirect_to discounts_path
    end

    private
        def discount_params
            params.require(:discount).permit(:brief_description, :complete_description, :start_date, :end_date, :reference, :notice, :discount_index, :group_id, :store_info_id, discount_requirement_sets_attributes: [:id, :bank_id, :card_id, :card_level_id, :_destroy])
        end

end
