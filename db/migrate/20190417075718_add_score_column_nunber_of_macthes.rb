class AddScoreColumnNunberOfMacthes < ActiveRecord::Migration[5.2]
  def change
    add_column :scores, :number_of_matches, :integer, default: 0
  end
end
