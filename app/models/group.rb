class Group < ActiveRecord::Base
    has_many :group_sets, dependent: :destroy
    validates :name, presence: true
end
