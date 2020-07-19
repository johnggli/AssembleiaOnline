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
require 'test_helper'

class PreRegistrationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
