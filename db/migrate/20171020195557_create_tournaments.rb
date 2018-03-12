class CreateTournaments < ActiveRecord::Migration[5.1]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.date :date
      t.references :user

      t.timestamps
    end
  end
end
