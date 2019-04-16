class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string       :nickname
      t.integer      :team_id
      t.integer      :user_id
      t.integer      :group_id
      t.timestamps
    end
  end
end
