# == Schema Information
#
# Table name: votes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  option_id  :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_votes_on_option_id  (option_id)
#  index_votes_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (option_id => options.id)
#  fk_rails_...  (user_id => users.id)
#
class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :option
end
