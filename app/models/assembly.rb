class Assembly < ApplicationRecord
    has_many :topics

    enum status: [:sketch, :open, :close]

    after_initialize :set_default_status, if: :new_record?

    def set_default_status
        self.status ||= :sketch
    end
end
