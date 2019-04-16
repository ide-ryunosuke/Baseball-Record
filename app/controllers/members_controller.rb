class MembersController < ApplicationController

  before_action :move_to_index, only: :new

  def index
    @member = Member.where(user_id: current_user.id)
  end

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
