class CreateJwtBlacklists < ActiveRecord::Migration[7.1]
  def change
    create_table :jwt_blacklists do |t|
      t.string :jti

      t.timestamps
    end
    add_index :jwt_blacklists, :jti
  end
end
