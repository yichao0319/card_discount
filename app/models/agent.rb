class Agent < ActiveRecord::Base
    has_many :card_levels, dependent: :destroy
    validates :name, presence: true
    validates_uniqueness_of :name
end
