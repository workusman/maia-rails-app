class User < ApplicationRecord
  has_many :client_users, dependent: :destroy
  has_many :clients, through: :client_users

  validates :email, presence: true
end
