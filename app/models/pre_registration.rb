# == Schema Information
#
# Table name: pre_registrations
#
#  id         :bigint           not null, primary key
#  ap         :integer
#  bloc       :integer
#  cpf        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PreRegistration < ApplicationRecord
    BLOCK = (1..36).to_a.freeze
    AP = [
        101, 102, 103, 104,
        201, 202, 203, 204,
        301, 302, 303, 304,
        401, 402, 403, 404,
        501, 502, 503, 504
    ].freeze

    default_scope { order(id: :desc) }
    
    has_one :user, dependent: :destroy

    validates :cpf, presence: true, uniqueness: true
    validates :bloc, presence: true, length: {maximum:2}
    validates :ap, presence: true, length: {maximum:3}
    validates :ap, uniqueness: { scope: :bloc }
end
