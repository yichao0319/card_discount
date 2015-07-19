class TagSet < ActiveRecord::Base
    belongs_to :tag
    belongs_to :discount
end
