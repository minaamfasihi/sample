class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true, uniqueness: true, length: { in: 6..20 }
  validates :username, presence: true, length: { in: 4..10 }
  validates :password, presence: true, length: { in: 6..12 }
  validates :status, presence: true

  enum status: [:qualified, :not_qualified, :banned]

  has_many :campaigns, dependent: :destroy

  actable
end
