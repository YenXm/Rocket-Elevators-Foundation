class Currency < ApplicationRecord
    def to_s
        self.fullname
    end
end
