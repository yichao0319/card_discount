class GroupSet < ActiveRecord::Base
    belongs_to :group
    belongs_to :store_info
end
