class ScoresController < ApplicationController
  def new
    @member = Member.find(params[:member_id])
    @score = Score.new
  end

  def create
  end
end
