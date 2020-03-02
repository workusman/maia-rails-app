class AddDomainToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :domain, :string
  end
end
