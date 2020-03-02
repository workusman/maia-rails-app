class CreateClientUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :client_users do |t|
      t.references :user
      t.references :client
      t.timestamps
    end
  end
end
