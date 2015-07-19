class TagsController < ApplicationController
    def create
        # render plain: params.inspect

        ## discount tags
        unless params[:discount_id].nil?
            @discount = Discount.find(params[:discount_id])
        
            ## belonging discounts
            unless params[:tag_ids].nil?
                @tag_ids = Tag.find(params[:tag_ids])
                @discount.tags = @tag_ids
            end

            @tag = @discount.tags.create(tag_params)
            redirect_to discount_path(@discount)
        end

        ## store_info tags
        unless params[:store_info_id].nil?
            @store_info = StoreInfo.find(params[:store_info_id])
        
            ## belonging stores
            unless params[:tag_ids].nil?
                @tag_ids = Tag.find(params[:tag_ids])
                @store_info.tags = @tag_ids
            end

            @tag = @store_info.tags.create(tag_params)
            redirect_to store_info_path(@store_info)
        end

        ## card tags
        unless params[:card_id].nil?
            @card = Card.find(params[:card_id])
        
            ## belonging stores
            unless params[:tag_ids].nil?
                @tag_ids = Tag.find(params[:tag_ids])
                @card.tags = @tag_ids
            end

            @tag = @card.tags.create(tag_params)
            redirect_to card_path(@card)
        end
    end

    def destroy
        ## discount tags
        unless params[:discount_id].nil?
            @discount = Discount.find(params[:discount_id])
            @tag_set = TagSet.find_by(discount_id: params[:discount_id], tag_id: params[:id])
            # render plain: params.inspect + "\n\n" + @tag_set.inspect
            @tag_set.destroy
            redirect_to discount_path(@discount)
        end

        ## store_info tags
        unless params[:store_info_id].nil?
            @store_info = StoreInfo.find(params[:store_info_id])
            @tag_set = TagSet.find_by(store_info_id: params[:store_info_id], tag_id: params[:id])
            # render plain: params.inspect + "\n\n" + @tag_set.inspect
            @tag_set.destroy
            redirect_to store_info_path(@store_info)
        end

        ## card tags
        unless params[:card_id].nil?
            @card = Card.find(params[:card_id])
            @tag_set = TagSet.find_by(card_id: params[:card_id], tag_id: params[:id])
            # render plain: params.inspect + "\n\n" + @tag_set.inspect
            @tag_set.destroy
            redirect_to card_path(@card)
        end
    end

    private
        def tag_params
            params.require(:tag).permit(:name)
        end
end
