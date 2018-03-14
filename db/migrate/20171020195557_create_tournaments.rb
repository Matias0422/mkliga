class CreateTournaments < ActiveRecord::Migration[5.1]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.date :date
      t.integer :user_id_owner
      t.integer :qtde_users

      t.timestamps
    end
  end
end
