class PreRegistration < ApplicationRecord
    has_one :user

    validates :cpf, presence: true, uniqueness: true
    validates :bloc, presence: true, length: {maximum:2}
    validates :ap, presence: true, length: {maximum:3}
end
