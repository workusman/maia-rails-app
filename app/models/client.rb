class Client < ApplicationRecord
  has_many :client_users, dependent: :destroy
  has_many :users, through: :client_users
end
