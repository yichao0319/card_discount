class Tag < ActiveRecord::Base
    has_many :tag_sets, dependent: :destroy
    has_many :discounts, :through => :tag_sets
    has_many :store_infos, :through => :tag_sets
    has_many :cards, :through => :tag_sets
    
    validates :name, presence: true
end
