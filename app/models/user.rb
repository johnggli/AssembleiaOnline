# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  paid                   :boolean          default(TRUE)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer
#  user_name              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  pre_registration_id    :bigint           not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_pre_registration_id   (pre_registration_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (pre_registration_id => pre_registrations.id)
#
class User < ApplicationRecord
  default_scope { order(id: :desc) }
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :pre_registration

  has_many :options, through: :votes

  enum role: [:user, :admin]

  after_initialize :set_default_role, if: :new_record?

  validates :pre_registration_id, presence: true, uniqueness: true
  validates :user_name, presence: true

  def set_default_role
    self.role ||= :user
  end

  def self.create_with_password(attr={})
    generated_password = "123456"
    self.new(attr.merge(password: generated_password, password_confirmation: generated_password))
  end
end
