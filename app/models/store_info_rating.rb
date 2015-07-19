class StoreInfoRating < ActiveRecord::Base
    belongs_to :store_info
    belongs_to :user
end
