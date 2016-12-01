class CreateUsers < ActiveRecord::Migration
  #Esta es la migracion de la clase users
  def change
    create_table :users do |t|
      t.string :mail
      t.string :password 
      t.timestamps
    end
  end
end
