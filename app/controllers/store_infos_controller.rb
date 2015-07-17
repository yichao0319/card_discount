class StoreInfosController < ApplicationController
    def new
        if current_user.nil?
            redirect_to store_infos_path
        end

        @store_info = StoreInfo.new
        @groups = Group.all
        @group = Group.new
    end

    def create
        @store_info = StoreInfo.new(store_info_params)
        @group = Group.new(group_params)
        # render plain: params[:store_info].inspect + params[:group].inspect
        # render plain: @group.inspect + " ||| " + @store_info.inspect

        @group_ids = nil
        unless @group.name.empty?
            if @group.save
                @group_ids = Array.wrap(params[:group_ids])
                @group_ids << @group.id.to_s
            else
                render 'new'
            end
        end

        unless @group_ids.nil?
            @group_ids = Group.find(@group_ids)
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
        if current_user.nil?
            redirect_to store_infos_path
        end

        @store_info = StoreInfo.find(params[:id])
        @groups = Group.all
        @group = Group.new

        # render plain: @groups.inspect
    end

    def update
        @store_info = StoreInfo.find(params[:id])
        @group = Group.new(group_params)
        # render plain: params[:store_info].inspect + params[:group].inspect
        # render plain: @group.inspect + " ||| " + @store_info.inspect

        @group_ids = nil
        unless @group.name.empty?
            if @group.save
                @group_ids = Array.wrap(params[:group_ids])
                @group_ids << @group.id.to_s
            else
                render 'new'
            end
        end

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
            params.require(:store_info).permit(:name, :country, :city, :district, :zip, :street, :phone, :official_site, :rate_reference, :rating, :photo)
        end

        def group_params
            params.require(:group).permit(:name, :photo, :store_infos)
        end
end
