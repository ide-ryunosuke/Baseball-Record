class AddColumnScoreSacrafacefly < ActiveRecord::Migration[5.2]
  def change
    add_column :scores, :sacrafice_fly, :integer, default: 0
  end
end
