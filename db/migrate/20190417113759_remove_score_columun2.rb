class RemoveScoreColumun2 < ActiveRecord::Migration[5.2]
  def change
    remove_column :scores, :number_of_matches
  end
end
