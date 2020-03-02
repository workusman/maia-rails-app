class ClientUser < ApplicationRecord
  belongs_to :client
  belongs_to :user
  validates_uniqueness_of :user_id, scope: :client_id, message: "is already registered with this Client"
end
