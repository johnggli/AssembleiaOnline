# == Schema Information
#
# Table name: assemblies
#
#  id           :bigint           not null, primary key
#  ata          :string
#  description  :text
#  finish_time  :datetime
#  start_time   :datetime
#  state        :integer
#  title        :string
#  topics_count :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Assembly < ApplicationRecord
    default_scope { order(id: :desc) }

    has_many :topics

    has_rich_text :description

    enum state: [:sketch, :open, :close]

    has_one_attached :ata

    attr_accessor :checkbox_checked

    after_initialize :set_default_state, if: :new_record?

    validates :title, presence: true, uniqueness: true
    validates :start_time, presence: true
    validates :finish_time, presence: true
    validate :finish_time_after_start_time?

    def set_default_state
        self.state ||= :sketch
    end

    def finish_time_after_start_time?
        if finish_time < start_time
            errors.add :finish_time, "must be after start date"
        end
    end
end
