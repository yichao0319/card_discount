class Tag < ActiveRecord::Base
    has_many :tag_sets, dependent: :destroy
    has_many :discounts, :through => :tag_sets
    
    validates :name, presence: true
end
