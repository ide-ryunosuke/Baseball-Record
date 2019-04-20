class MembersController < ApplicationController

  before_action :move_to_index, only: [:new, :show]

  def index
    @member = Member.where(user_id: current_user&.id)
    @score = Score.where(user_id: current_user&.id)
    @plate_appearance = @score.sum(:plate_appearance)
    @at_bat = @score.sum(:at_bat)
    @hit = @score.sum(:hit)
    @runs_batted_in = @score.sum(:runs_batted_in)
    @sacrafice = @score.sum(:sacrafice)
    @sacrafice_fly = @score.sum(:sacrafice_fly)
    @walk = @score.sum(:walk)
    @strikeout = @score.sum(:strikeout)
    @stolen_base = @score.sum(:stolen_base)
    @run = @score.sum(:run)
    @home_run = @score.sum(:home_run)
    @game_count = @score.length
    batting_average = @hit.to_f / @at_bat
    @batting_average_round = batting_average.round(3)
    on_base = (@hit + @walk).to_f / (@at_bat + @walk + @sacrafice_fly)
    @on_base_percentage = on_base.round(3)
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.create(member_params)
    redirect_to root_path
  end

  def show
    @score = Score.where(member_id: params[:id])
    @plate_appearance = @score.sum(:plate_appearance)
    @at_bat = @score.sum(:at_bat)
    @hit = @score.sum(:hit)
    @runs_batted_in = @score.sum(:runs_batted_in)
    @sacrafice = @score.sum(:sacrafice)
    @sacrafice_fly = @score.sum(:sacrafice_fly)
    @walk = @score.sum(:walk)
    @strikeout = @score.sum(:strikeout)
    @stolen_base = @score.sum(:stolen_base)
    @run = @score.sum(:run)
    @home_run = @score.sum(:home_run)
    batting_average = @hit.to_f / @at_bat
    @batting_average_round = batting_average.round(3)
    on_base = (@hit + @walk).to_f / (@at_bat + @walk + @sacrafice_fly)
    @on_base_percentage = on_base.round(3)
  end

  private
  def member_params
    params.require(:member).permit(:nickname).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
end
