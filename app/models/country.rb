class Country < ApplicationRecord
    def to_s
        self.country_name
    end
end
