class Topic < ApplicationRecord
  belongs_to :assembly

  has_many :options
end
