class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :github_id
      t.string :name
      t.string :email
      t.string :iamge
      t.string :auth_hash

      t.timestamps null: false
    end
  end
end
