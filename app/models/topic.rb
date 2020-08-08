# == Schema Information
#
# Table name: topics
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  assembly_id :bigint           not null
#
# Indexes
#
#  index_topics_on_assembly_id  (assembly_id)
#
# Foreign Keys
#
#  fk_rails_...  (assembly_id => assemblies.id)
#
class Topic < ApplicationRecord
  default_scope { order(id: :desc) }

  belongs_to :assembly, inverse_of: :topics, counter_cache: true
  has_many :options, dependent: :destroy, inverse_of: :topic
  
  accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true

  has_rich_text :description

  validates :title, presence: true
  validates :description, presence: true
  validates :assembly_id, presence: true

  def sum_votes
    options.map { |option| option.votes.count }.sum
  end

  def user_voted(current_user_id)
    options.map { |option| option.users.exists?(current_user_id) }.include?(true)
  end
end
