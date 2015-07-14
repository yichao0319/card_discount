class Bank < ActiveRecord::Base
	has_many :cards, dependent: :destroy
	validates :name, presence: true
	validates_uniqueness_of :name

	def name_with_swift_number
		"#{swift_number} #{name}"
	end
end
