class CreateUsersTournamentsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :tournaments do |t|
      t.index [:user_id, :tournament_id], unique: true
      t.index [:tournament_id, :user_id], unique: true
    end
  end
end
