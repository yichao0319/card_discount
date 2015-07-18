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
        
        @store_info_update_data = store_info_params
        @store_info_update_data['photo'] = nil
        @store_info = StoreInfo.new(@store_info_update_data)
        ## save to get id
        unless @store_info.save
            render 'new'
        end

        ## store logo
        @store_info_update_data = store_info_params
        unless params[:store_info][:photo].nil?
            ## rename figure to avoid overwrite
            if params[:store_info][:photo].original_filename =~ /.*\.(.*)/
                @file_name = "id" + @store_info.id.to_s + "." + $1
            else
                @file_name = "id" + @store_info.id.to_s + "." + params[:store_info][:photo].original_filename
            end

            @stored_file_path = Rails.root.join('public', 'photo', 'store_infos', @file_name)
            File.open(@stored_file_path, 'wb') do |file|
                file.write(params[:store_info][:photo].read)
            end

            @store_info_update_data['photo'] = @file_name
        end

        ## group
        @group_update_data = group_params
        @group_update_data['photo'] = nil
        @group = Group.new(@group_update_data)
        
        @group_ids = Array.wrap(params[:group_ids])
        ## new group
        unless @group.name.empty?
            if @group.save
                @group_ids << @group.id.to_s
            else
                render 'new'
            end

            ## group logo
            @group_update_data = group_params
            unless params[:group][:photo].nil?
                ## rename figure to avoid overwrite
                if params[:group][:photo].original_filename =~ /.*\.(.*)/
                    @file_name = "id" + @group.id.to_s + "." + $1
                else
                    @file_name = "id" + @group.id.to_s + "." + params[:group][:photo].original_filename
                end

                @stored_file_path = Rails.root.join('public', 'photo', 'groups', @file_name)
                File.open(@stored_file_path, 'wb') do |file|
                    file.write(params[:group][:photo].read)
                end

                @group_update_data['photo'] = @file_name

                unless @group.update(@group_update_data)
                    render 'new'
                end
            end
        end

        @store_info = StoreInfo.new(@store_info_update_data)
        
        ## add groups of the store
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

        ## add new group
        @group_ids = nil
        unless @group.name.empty?
            if @group.save
                @group_ids = Array.wrap(params[:group_ids])
                @group_ids << @group.id.to_s
            else
                render 'new'
            end
        end

        ## store logo
        @store_info_update_data = store_info_params
        unless params[:store_info][:photo].nil?
            if params[:store_info][:photo].original_filename =~ /.*\.(.*)/
                @file_name = "id" + @store_info.id.to_s + "." + $1
            else
                @file_name = "id" + @store_info.id.to_s + "." + params[:store_info][:photo].original_filename
            end

            @stored_file_path = Rails.root.join('public', 'photo', 'store_infos', @file_name)
            File.open(@stored_file_path, 'wb') do |file|
                file.write(params[:store_info][:photo].read)
            end

            @store_info_update_data['photo'] = @file_name
        end

        ## update belonging groups
        unless params[:group_ids].nil?
            @group_ids = Group.find(params[:group_ids])
            @store_info.groups = @group_ids
        end
        
        ## update store_info
        if @store_info.update(@store_info_update_data)
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
        
        ## delete logo
        unless @store_info.photo.nil?
            @logo_file = Rails.root.join('public', 'photo', 'store_infos', @store_info.photo)
            File.delete(@logo_file) if File.exist?(@logo_file)
        end
        
        ## delete db entry
        @store_info.destroy

        redirect_to store_infos_path
    end

    def logo
        @store_info = StoreInfo.find(params[:id])
        unless @store_info.photo.nil?
            File.open(Rails.root.join('public', 'photo', 'store_infos', @store_info.photo), 'rb') do |f|
                send_data f.read, :disposition => "inline"
            end
        end
    end

    private
        def store_info_params
            params.require(:store_info).permit(:name, :country, :city, :district, :zip, :street, :phone, :official_site, :rate_reference, :rating, :photo)
        end

        def group_params
            params.require(:group).permit(:name, :photo, :store_infos)
        end
end
