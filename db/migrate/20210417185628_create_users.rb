class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :mailadress
      t.string :password
      t.string :image
      t.string :username
      t.text :about

      t.timestamps
    end
  end
end
