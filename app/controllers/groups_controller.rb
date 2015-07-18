class GroupsController < ApplicationController
    def new
        if current_user.nil? 
            redirect_to groups_path
        end

        @group = Group.new
        @store_infos = StoreInfo.all
    end

    def create
        # render plain: params[:group].inspect

        @group_update_data = group_params
        @group_update_data['photo'] = nil
        @group = Group.new(@group_update_data)
        ## save to get id
        unless @group.save
            render 'new'
        end

        
        ## logo
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
        end
        
        ## belonging stores
        unless params[:store_info_ids].nil?
            @store_info_ids = StoreInfo.find(params[:store_info_ids])
            @group.store_infos = @store_info_ids
        end

        if @group.update(@group_update_data)
            redirect_to @group
        else
            render 'new'
        end
        
    end

    def show
        @group = Group.find(params[:id])
    end

    def edit
        if current_user.nil? 
            redirect_to groups_path
        end

        @group = Group.find(params[:id])
        @store_infos = StoreInfo.all
    end

    def update
        @group = Group.find(params[:id])
        
        unless params[:store_info_ids].nil?
            @store_info_ids = StoreInfo.find(params[:store_info_ids])
            @group.store_infos = @store_info_ids
        end

        @group_update_data = group_params
        unless params[:group][:photo].nil?
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
        end

        
        if @group.update(@group_update_data)
            redirect_to @group
        else
            render 'edit'
        end
    end

    def index
        @group = Group.all
    end

    def destroy
        @group = Group.find(params[:id])

        ## delete logo
        unless @group.photo.nil?
            @logo_file = Rails.root.join('public', 'photo', 'groups', @group.photo)
            File.delete(@logo_file) if File.exist?(@logo_file)
        end

        ## delete db entry
        @group.destroy

        redirect_to groups_path
    end

    def logo
        @group = Group.find(params[:id])
        unless @group.photo.nil?
            File.open(Rails.root.join('public', 'photo', 'groups', @group.photo), 'rb') do |f|
                send_data f.read, :disposition => "inline"
            end
        end
    end

    private
        def group_params
            params.require(:group).permit(:name, :photo, :store_infos)
        end


end
