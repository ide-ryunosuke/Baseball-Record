module MembersHelper
  def total_match(member_id)
    @member_score = Score.where(member_id: member_id)
    @member_score.length
  end

  def total_batting_average
    @total_hit = @member_score.sum(:hit)
    @total_at_bat = @member_score.sum(:at_bat)
    if @total_hit == 0 && @total_at_bat == 0
      0.0
    else
      (@total_hit.to_f / @total_at_bat).round(3)
    end
  end

  def total_plate_appearance
    @member_score.sum(:plate_appearance)
  end

  def total_at_bat
    @total_at_bat
  end

  def total_hit
    @total_hit
  end

  def total_runs_batted_in
    @member_score.sum(:runs_batted_in)
  end

  def total_sacrafice
    @member_score.sum(:sacrafice)
  end

  def total_sacrafice_fly
    @total_sacrafice_fly = @member_score.sum(:sacrafice_fly)
  end

  def total_walk
    @total_walk = @member_score.sum(:walk)
  end

  def total_strikeout
    @member_score.sum(:strikeout)
  end

  def total_stolen_base
    @member_score.sum(:stolen_base)
  end

  def total_run
    @member_score.sum(:run)
  end

  def total_home_run
    @member_score.sum(:home_run)
  end

  def total_on_base_percentage
    if @total_hit == 0 && @total_walk == 0 && @total_at_bat == 0 && @total_sacrafice_fly == 0
      0.0
    else
      ((@total_hit + @total_walk).to_f / (@total_at_bat + @total_walk + @total_sacrafice_fly)).round(3)
    end
  end

  def batting_average_show(score)
    if score.at_bat == 0 && score.hit == 0
      0.0
    else
      (score.hit.to_f / score.at_bat).round(3)
    end
  end

  def on_base_percentage_show(score)
    if score.hit == 0 && score.walk == 0 && score.at_bat == 0 && score.sacrafice_fly == 0
      0.0
    else
      ((score.hit + score.walk).to_f / (score.at_bat + score.walk + score.sacrafice_fly)).round(3)
    end
  end
end
