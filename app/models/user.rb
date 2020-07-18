class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :pre_registration
  has_many :options, :through => :votes 
  enum role: [:user, :admin]

  def set_default_password
    
  end
end
