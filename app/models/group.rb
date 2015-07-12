class Group < ActiveRecord::Base
    has_many :group_sets, dependent: :destroy
    has_many :store_infos, :through => :group_sets
    validates :name, presence: true
end
