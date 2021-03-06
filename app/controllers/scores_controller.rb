class ScoresController < ApplicationController
  def new
    @member = Member.find(params[:member_id])
    score_member = Score.where(member_id: @member.id)
    @game_count = score_member.length + 1
    @score = Score.new
  end

  def create
    @score = Score.create(score_params)
    redirect_to root_path
  end

  def edit
    @score = Score.find(params[:member_id])
    @member = Member.find(params[:id])
  end

  def update
    @score = Score.find(params[:member_id])
    @score.update(score_update_params)
    redirect_to member_path
  end

  def destroy
    @score = Score.find(params[:member_id])
    @score.destroy
    redirect_to member_path
  end

  private
  def score_params
    params.require(:score).permit(:plate_appearance, :at_bat, :hit, :runs_batted_in, :sacrafice, :sacrafice_fly, :walk, :strikeout, :stolen_base, :run, :home_run).merge(user_id: current_user.id, member_id: params[:member_id])
  end

  def score_update_params
    params.require(:score).permit(:plate_appearance, :at_bat, :hit, :runs_batted_in, :sacrafice, :sacrafice_fly, :walk, :strikeout, :stolen_base, :run, :home_run)
  end
end
