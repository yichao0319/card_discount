class Group < ActiveRecord::Base
    ## Automatic deletion of join models is direct, no destroy callbacks are triggered.
    has_many :group_sets
    has_many :store_infos, :through => :group_sets
    validates :name, presence: true
end
