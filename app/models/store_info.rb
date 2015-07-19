class StoreInfo < ActiveRecord::Base
    has_many :group_sets, dependent: :destroy
    has_many :groups, :through => :group_sets
    
    has_many :store_info_ratings, dependent: :destroy
    has_many :users, :through => :store_info_ratings

    has_many :tag_sets, dependent: :destroy
    has_many :tags, :through => :tag_sets

    validates :name, presence: true
end
