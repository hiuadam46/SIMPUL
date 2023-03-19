class HomeController < ApplicationController
  def index
    @current_user = current_user
    @rooms = Room.all()
  end
end
