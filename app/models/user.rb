class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :pre_registration
  has_many :options, :through => :votes 
  enum role: [:user, :admin]

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  def self.create_with_password(attr={})
    generated_password = "123456"
    self.new(attr.merge(password: generated_password, password_confirmation: generated_password))
  end
end
