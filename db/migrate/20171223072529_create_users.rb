class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :password, null: false
      t.string :password_digest
      t.integer :access_level, default: 0
      t.string :avatar

      t.timestamps
    end
  end
end
