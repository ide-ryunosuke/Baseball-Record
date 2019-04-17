class RemoveScoreColumun < ActiveRecord::Migration[5.2]
  def change
    remove_column :scores, :batting_average
    remove_column :scores, :on_base_percentage
  end
end
