class DiscountRequirementSet < ActiveRecord::Base
    belongs_to :discount
    belongs_to :bank
    belongs_to :card
    belongs_to :card_level
    
    # validates :discount_id, presence: true

    def name
        @name = ""
        unless bank.nil?
            @name = "#{bank.name_with_swift_number}"
        end

        unless card.nil?
            unless @name.empty?
                @name += ", "
            end
            
            @name += "#{card.full_name}"
        end

        unless card_level.nil?
            unless @name.empty?
                @name += ", "
            end
            
            @name += "#{card_level.name_with_agent}"
        end

        return @name
    end
end
