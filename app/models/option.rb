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
  
  has_many :votes, dependent: :destroy, inverse_of: :option
  has_many :users, through: :votes

  validates :description, presence: true
  validates :topic_id, presence: true

  def percent_votes
    topic.sum_votes.zero? ? 0 : ((votes.count/topic.sum_votes.to_f)*100).round(2)
  end
end
