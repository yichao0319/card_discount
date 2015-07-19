class Card < ActiveRecord::Base
    belongs_to :bank
    belongs_to :card_type
    belongs_to :card_level

    has_many :wallets
    has_many :users, :through => :wallets

    has_many :tag_sets, dependent: :destroy
    has_many :tags, :through => :tag_sets

    has_many :card_ratings, dependent: :destroy
    has_many :rating_users, :through => :card_ratings, :source => :user

    validates :name, presence: true

    def full_name
        @full_name = "#{self.name} - "

        unless bank.nil?
            @full_name += "#{bank.name}, "
        end

        unless card_level.nil?
            @full_name += "#{card_level.name_with_agent}, "
        end

        unless card_type.nil?
            @full_name += "#{card_type.name}"
        end

        return @full_name
    end
end
