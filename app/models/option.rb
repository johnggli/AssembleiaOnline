# == Schema Information
#
# Table name: options
#
#  id          :bigint           not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  topic_id    :bigint           not null
#
# Indexes
#
#  index_options_on_topic_id  (topic_id)
#
# Foreign Keys
#
#  fk_rails_...  (topic_id => topics.id)
#
class Option < ApplicationRecord
  belongs_to :topic

  validates :description, presence: true, uniqueness: true
  
  has_many :users, :through => :votes 
end
