class Migrant < ApplicationRecord
    has_many :migrant_lead_reviews
    has_many :migrant_shelters, dependent: :destroy
    has_many :migrant_lead_reviews
    has_many :migrant_shelter_reviews
    has_many :shelters, through: :migrant_shelters
    has_one :unit
    has_secure_password

    validates  :name, :description, :birthdate, :origin_country, :picture, presence: true
    # :password, :password_confirmation,

    def lead_info
        if self.shelters.empty?
          Lead.first
        else
          lead = self.shelters[0].lead
        end
      end
    
      def shelter_check
        # byebug
        mig_id =self.id
        if self.shelters.length<1
          MigrantShelter.create(
            migrant_id: self.id,
            shelter_id: Shelter.first.id,
            active: true
        )
        elsif self.shelters.length>1
          MigrantShelter.find(self.migrant_shelters[0].id).destroy
        else
          true
        end
      end
      

end
