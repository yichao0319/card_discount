class StoreInfo < ActiveRecord::Base
    has_many :group_sets, dependent: :destroy
    has_many :groups, :through => :group_sets
    validates :name, presence: true
end
