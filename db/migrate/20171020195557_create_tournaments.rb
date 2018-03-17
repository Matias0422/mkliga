class CreateTournaments < ActiveRecord::Migration[5.1]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.date :date
      t.integer :user_id_owner
      t.integer :qtde_users
      t.time :time
      t.references :location

      t.timestamps
    end
  end
end
