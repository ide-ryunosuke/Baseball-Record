class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.integer      :user_id
      t.integer      :member_id
      t.integer      :batting_average,    default: 0
      t.integer      :plate_appearance,   default: 0
      t.integer      :at_bat,             default: 0
      t.integer      :hit,                default: 0
      t.integer      :runs_batted_in,     default: 0
      t.integer      :sacrafice,          default: 0
      t.integer      :walk,               default: 0
      t.integer      :strikeout,          default: 0
      t.integer      :stolen_base,        default: 0
      t.integer      :run,                default: 0
      t.integer      :home_run,           defaule: 0
      t.integer      :on_base_percentage, default: 0
      t.timestamps
    end
  end
end
