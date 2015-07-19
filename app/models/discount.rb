class Discount < ActiveRecord::Base
    belongs_to :group
    belongs_to :store_info

    has_many :discount_requirement_sets, dependent: :destroy
    accepts_nested_attributes_for :discount_requirement_sets, :reject_if => lambda { |a| a[:bank_id].blank? && a[:card_id].blank? && a[:card_level_id].blank?}, :allow_destroy => true
    has_many :banks, :through => :discount_requirement_sets
    has_many :cards, :through => :discount_requirement_sets
    has_many :card_levels, :through => :discount_requirement_sets

    has_many :tag_sets, dependent: :destroy
    has_many :tags, :through => :tag_sets
    # accepts_nested_attributes_for :tags, :reject_if => lambda { |a| a[:name].blank?}, :allow_destroy => true

    has_many :discount_ratings, dependent: :destroy
    has_many :users, :through => :discount_ratings
    
    # validates :complete_description, presence: true
end
