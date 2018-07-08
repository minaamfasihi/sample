class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true, uniqueness: true, length: { in: 6..20 }
  validates :username, presence: true, length: { in: 4..10 }
  validates :status, presence: true

  has_many :todo_lists
  enum status: [:qualified, :not_qualified, :banned]
  enum actable_types: [:Expert, :Novice]
  actable

  def is_expert?
    return actable_type == "Expert"
  end

  def is_novice?
    return actable_type == "Novice"
  end
end
