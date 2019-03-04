class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :database_authenticatable,
  :jwt_authenticatable, jwt_revocation_strategy: Blacklist

  before_validation :downcase_email
  validates :email, uniqueness: true, presence: true

  private

  def downcase_email
  	self.email = email.strip.downcase if email.present?
  end
end
