class Expert < ApplicationRecord
  acts_as :user

  has_many :campaigns, dependent: :destroy

  validates :profession, length: { maximum: 20 }
  validates :service, length: { maximum: 20 }
end
