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
    has_many :topics

    has_rich_text :description

    enum state: [:sketch, :open, :close]

    has_one_attached :ata

    attr_accessor :checkbox_checked

    after_initialize :set_default_state, if: :new_record?

    def set_default_state
        self.state ||= :sketch
    end
end
