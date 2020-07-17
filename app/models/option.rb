class Option < ApplicationRecord
  belongs_to :topic
  
  has_many :users, :through => :votes 
end
