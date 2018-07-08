class HomeController < ApplicationController
  def index
    @novices = User.where(actable_type: 'Novice')
  end
end
