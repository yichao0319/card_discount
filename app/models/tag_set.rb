class TagSet < ActiveRecord::Base
    belongs_to :tag
    belongs_to :discount
    belongs_to :store_info
    belongs_to :card
end
