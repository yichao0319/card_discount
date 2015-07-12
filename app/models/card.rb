class Card < ActiveRecord::Base
    belongs_to :bank
    belongs_to :card_type
    belongs_to :card_level
    validates :name, presence: true
end
