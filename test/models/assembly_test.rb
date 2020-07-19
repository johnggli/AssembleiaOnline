# == Schema Information
#
# Table name: assemblies
#
#  id           :bigint           not null, primary key
#  description  :text
#  finish_time  :datetime
#  start_time   :datetime
#  state        :integer
#  title        :string
#  topics_count :integer
#  url_ata      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'test_helper'

class AssemblyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
