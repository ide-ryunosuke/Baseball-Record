class ChangeColmunScore < ActiveRecord::Migration[5.2]
  def change
    change_column :scores, :home_run, :integer, default: 0
  end
end
