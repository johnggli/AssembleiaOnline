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
    default_scope { order(id: :desc) }
    
    has_one :user

    validates :cpf, presence: true, uniqueness: true
    validates :bloc, presence: true, length: {maximum:2}
    validates :ap, presence: true, length: {maximum:3}
end
