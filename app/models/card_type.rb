class CardType < ActiveRecord::Base
    has_many :cards, dependent: :destroy
    validates :name, presence: true
    validates_uniqueness_of :name
end
