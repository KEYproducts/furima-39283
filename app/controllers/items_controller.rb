class ItemsController < ApplicationController
  before_action :confilm_user_signed_in, only: :new

  def index
  end

  def new
    @item = Item.new
  end

  def create
  end

  private

  def confilm_user_signed_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
