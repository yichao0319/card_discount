class CardLevel < ActiveRecord::Base
    has_many :cards, dependent: :destroy
    belongs_to :agent
    validates :name, presence: true
    validates :level, presence: true
    validates_uniqueness_of :level, scope: :agent_id

    def name_with_agent
        if agent.nil?
            "#{name}"
        else
            "#{agent.name} #{name}"
        end
    end
end
