class MembersController < ApplicationController

  before_action :move_to_index, only: :new

  def index
  end

  def new
  end

  private
  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
end
