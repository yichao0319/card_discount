class StoreInfosController < ApplicationController
    def new
        @store_info = StoreInfo.new
        @groups = Group.all
    end

    def create
        # render plain: params[:store_info].inspect
        @store_info = StoreInfo.new(store_info_params)

        unless params[:group_ids].nil?
            @group_ids = Group.find(params[:group_ids])
            @store_info.groups = @group_ids
        end
        
        if @store_info.save
            redirect_to @store_info
        else
            render 'new'
        end
        
    end

    def show
        @store_info = StoreInfo.find(params[:id])
    end

    def edit
        @store_info = StoreInfo.find(params[:id])
        @groups = Group.all

        # render plain: @groups.inspect
    end

    def update
        @store_info = StoreInfo.find(params[:id])

        unless params[:group_ids].nil?
            @group_ids = Group.find(params[:group_ids])
            @store_info.groups = @group_ids
        end
        
        if @store_info.update(store_info_params)
            redirect_to @store_info
        else
            render 'edit'
        end
    end

    def index
        @store_info = StoreInfo.all
    end

    def destroy
        @store_info = StoreInfo.find(params[:id])
        @store_info.destroy

        redirect_to store_infos_path
    end

    private
        def store_info_params
            params.require(:store_info).permit(:name, :country, :city, :district, :zip, :street, :phone, :official_site, :rate_reference, :rating, :photo, :groups)
        end
end
