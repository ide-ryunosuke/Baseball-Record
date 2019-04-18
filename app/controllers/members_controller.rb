class MembersController < ApplicationController

  before_action :move_to_index, only: :new

  def index
    @member = Member.where(user_id: current_user&.id)
    score_user = Score.where(user_id: current_user&.id)
    @plate_appearance = score_user.sum(:plate_appearance)
    @at_bat = score_user.sum(:at_bat)
    @hit = score_user.sum(:hit)
    @runs_batted_in = score_user.sum(:runs_batted_in)
    @sacrafice = score_user.sum(:sacrafice)
    @sacrafice_fly = score_user.sum(:sacrafice_fly)
    @walk = score_user.sum(:walk)
    @strikeout = score_user.sum(:strikeout)
    @stolen_base = score_user.sum(:stolen_base)
    @run = score_user.sum(:run)
    @home_run = score_user.sum(:home_run)
    @game_count = score_user.length
    batting_average = @hit.to_f / @at_bat
    @batting_average_round = batting_average.round(3)
    # on_base = (@hit + @walk).to_f / (@at_bat + @walk + )
    # @on_base_percentage
  end
  # 出塁率＝（安打数+四球数+死球数）÷（打数+四球数+死球数+犠飛数）
  #
  # |plate_appearance|integer|default: 0|     <!-- 打席数 -->
  # |at_bat|integer|default: 0|               <!-- 打数 -->
  # |hit|integer|default: 0|                  <!-- 安打 -->
  # |runs_batted_in|integer|default: 0|       <!-- 打点 -->
  # |sacrafice|integer|default: 0|            <!-- 犠打 -->
  # |walk|integer|default: 0|                 <!-- 四死球 -->
  # |strikeout|integer|default: 0|            <!-- 三振 -->
  # |stolen_base|integer|default: 0|          <!-- 盗塁 -->
  # |run|integer|default: 0|                  <!-- 得点 -->
  # |home_run|integer|default: 0|             <!-- 本塁打 -->

  def new
    @member = Member.new
  end

  def create
    @member = Member.create(member_params)
    redirect_to root_path
  end

  private
  def member_params
    params.require(:member).permit(:nickname).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
end
